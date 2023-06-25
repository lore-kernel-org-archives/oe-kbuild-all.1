Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CF9AA6AD7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 Jun 2023 15:40:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=CnvPqkEF1ZvSVZjF3J3bBF7ccQ4Zr/q4D30SasyGiyY=;
  b=UhRzhEV/gmytq6wuwa8I0+sle5IrZootZAaQCwTN95k3j5VjTbKTaFLv
   9yCCrwmfkDk7BLiv22+R9u3pBmQVA1iWOdRJrL43PDWuPs02u9AAJN/VS
   HmZkTwkW4v1Ys/KmfYWo3wJha6Qjb/wtc3wwhaejMI8EpUpVStn+wjsRc
   M=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.01,157,1684792800"; 
   d="scan'208";a="59750718"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 Jun 2023 17:40:35 +0200
Date: Sun, 25 Jun 2023 17:40:35 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Andreas Gruenbacher <agruenba@redhat.com>
cc: Linux Memory Management List <linux-mm@kvack.org>, 
    oe-kbuild-all@lists.linux.dev
Subject: [linux-next:master 9366/12162] fs/gfs2/super.c:762:0-1: preceding
 lock on line 738 (fwd)
Message-ID: <alpine.DEB.2.22.394.2306251739540.3022@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Please check whether an unlock is needed in the goto out case.

julia

---------- Forwarded message ----------
Date: Sun, 25 Jun 2023 23:06:48 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [linux-next:master 9366/12162] fs/gfs2/super.c:762:0-1: preceding lock
    on line 738

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: Linux Memory Management List <linux-mm@kvack.org>
TO: Andreas Gruenbacher <agruenba@redhat.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   8d2be868b42c08290509c60515865f4de24ea704
commit: 4ad135d5be933a17cd07d09a77470ca169baf869 [9366/12162] gfs2: Rework freeze / thaw logic
:::::: branch date: 2 days ago
:::::: commit date: 10 days ago
config: s390-randconfig-r054-20230625 (https://download.01.org/0day-ci/archive/20230625/202306252241.Lahe2YsR-lkp@intel.com/config)
compiler: s390-linux-gcc (GCC) 12.3.0
reproduce: (https://download.01.org/0day-ci/archive/20230625/202306252241.Lahe2YsR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202306252241.Lahe2YsR-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> fs/gfs2/super.c:762:0-1: preceding lock on line 738

vim +762 fs/gfs2/super.c

4ad135d5be933a Andreas Gruenbacher 2022-11-14  731
4ad135d5be933a Andreas Gruenbacher 2022-11-14  732  void gfs2_freeze_func(struct work_struct *work)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  733  {
4ad135d5be933a Andreas Gruenbacher 2022-11-14  734  	struct gfs2_sbd *sdp = container_of(work, struct gfs2_sbd, sd_freeze_work);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  735  	struct super_block *sb = sdp->sd_vfs;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  736  	int error;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  737
4ad135d5be933a Andreas Gruenbacher 2022-11-14 @738  	mutex_lock(&sdp->sd_freeze_mutex);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  739  	error = -EBUSY;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  740  	if (atomic_read(&sdp->sd_freeze_state) != SFS_UNFROZEN)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  741  		goto out_unlock;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  742
4ad135d5be933a Andreas Gruenbacher 2022-11-14  743  	error = gfs2_freeze_locally(sdp);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  744  	if (error)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  745  		goto out_unlock;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  746
4ad135d5be933a Andreas Gruenbacher 2022-11-14  747  	gfs2_freeze_unlock(&sdp->sd_freeze_gh);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  748  	atomic_set(&sdp->sd_freeze_state, SFS_FROZEN);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  749
4ad135d5be933a Andreas Gruenbacher 2022-11-14  750  	error = gfs2_do_thaw(sdp);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  751  	if (error)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  752  		goto out;
4ad135d5be933a Andreas Gruenbacher 2022-11-14  753
4ad135d5be933a Andreas Gruenbacher 2022-11-14  754  	atomic_set(&sdp->sd_freeze_state, SFS_UNFROZEN);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  755
4ad135d5be933a Andreas Gruenbacher 2022-11-14  756  out_unlock:
4ad135d5be933a Andreas Gruenbacher 2022-11-14  757  	mutex_unlock(&sdp->sd_freeze_mutex);
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  758  	deactivate_super(sb);
4ad135d5be933a Andreas Gruenbacher 2022-11-14  759  out:
4ad135d5be933a Andreas Gruenbacher 2022-11-14  760  	if (error)
4ad135d5be933a Andreas Gruenbacher 2022-11-14  761  		fs_info(sdp, "GFS2: couldn't freeze filesystem: %d\n", error);
2e60d7683c8d2e Benjamin Marzinski  2014-11-13 @762  }
2e60d7683c8d2e Benjamin Marzinski  2014-11-13  763

:::::: The code at line 762 was first introduced by commit
:::::: 2e60d7683c8d2ea21317f6d9f4cd3bf5428ce162 GFS2: update freeze code to use freeze/thaw_super on all nodes

:::::: TO: Benjamin Marzinski <bmarzins@redhat.com>
:::::: CC: Steven Whitehouse <swhiteho@redhat.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
