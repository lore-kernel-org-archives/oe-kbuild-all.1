Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 245DD4C62E
	for <oe-kbuild-all@lists.linux.dev>; Sat, 28 Dec 2024 06:28:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1735367302; cv=none; b=Dt2edtm4U0Ylr9YldjdMJI2KXf3niL8tNkrZXxSrO6ua+CZb0pXDUkvBqsAuxSLbaViGPEAwqVBvbAH6JpWqqMSeFvyN+0zhFNu6NLEfw3k+eVUeeL9GoTojjUuWo1WfHEhI7fbGA+NCvYfUCCPKsePuolnILgNH+MZ9VZzQ4fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1735367302; c=relaxed/simple;
	bh=d9rFA0aFAmq2vvnUbiF8vH505JoZUmu752qiFXuXFRw=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=uAWxfy0Tv0MOmYsLQ8fEql6gszfUf/X5oMPsC4+whMGjmV0oW0YZwrlm6vyp8a1GLO0vgtymKxb5HlFJ1DLka/I7EtdsA/8Wh5RYxzL9cwqZG7DRU/RY+wk+Rtrf6SmvcSCJIZ5rtaPjAqdm4BUz1mTDFNmkpAcXpWVYCv7MIXo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=WqCePZkm; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="WqCePZkm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tL6FTj7hHRs/XTnPkO//SYZZjqX7NsloZUqPx7rpAfM=;
  b=WqCePZkmy1ukULwoYo3q4covy+1eNhjOWGyCt2ZHKiNMlRi+arXcFiBR
   5GDXlI4urP2trXpAjyow9PabMKuoZHzg8o1/wp7N7j2bs/YWo/bU4xz6U
   pwSt++d3WM48bA8aq53/ZeOjPCClOH4osp2m8+eJzYqLYw6apuvGSDri+
   c=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.12,271,1728943200"; 
   d="scan'208";a="200897333"
Received: from 231.85.89.92.rev.sfr.net (HELO hadrien) ([92.89.85.231])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Dec 2024 07:27:05 +0100
Date: Sat, 28 Dec 2024 07:27:05 +0100 (CET)
From: Julia Lawall <julia.lawall@inria.fr>
X-X-Sender: jll@hadrien
To: Zheng Zengkai <zhengzengkai@huawei.com>
cc: kernel@openeuler.org, oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 2601/2601] kernel/stackleak.c:42:5-10: opportunity
 for str_enabled_disabled(state) (fwd)
Message-ID: <alpine.DEB.2.22.394.2412280726470.3574@hadrien>
User-Agent: Alpine 2.22 (DEB 394 2020-01-19)
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



---------- Forwarded message ----------
Date: Sat, 28 Dec 2024 04:51:53 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: [openeuler:OLK-5.10 2601/2601] kernel/stackleak.c:42:5-10: opportunity
    for str_enabled_disabled(state)

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
TO: kernel@openeuler.org
TO: Zheng Zengkai <zhengzengkai@huawei.com>

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   053a6b6f8e4c86200cdb20bc80c063c3bb119859
commit: 9d423ac5414e69a36e95dc0b77392429c507cbe1 [2601/2601] gcc-plugins: simplify GCC plugin-dev capability test
:::::: branch date: 15 hours ago
:::::: commit date: 2 years, 11 months ago
config: x86_64-randconfig-101-20241228 (https://download.01.org/0day-ci/archive/20241228/202412280419.SeKIgBFA-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202412280419.SeKIgBFA-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> kernel/stackleak.c:42:5-10: opportunity for str_enabled_disabled(state)

vim +42 kernel/stackleak.c

964c9dff009189 Alexander Popov 2018-08-17  21
964c9dff009189 Alexander Popov 2018-08-17  22  int stack_erasing_sysctl(struct ctl_table *table, int write,
4773ef33fc6e59 Tobias Klauser  2020-09-18  23  			void *buffer, size_t *lenp, loff_t *ppos)
964c9dff009189 Alexander Popov 2018-08-17  24  {
964c9dff009189 Alexander Popov 2018-08-17  25  	int ret = 0;
964c9dff009189 Alexander Popov 2018-08-17  26  	int state = !static_branch_unlikely(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  27  	int prev_state = state;
964c9dff009189 Alexander Popov 2018-08-17  28
964c9dff009189 Alexander Popov 2018-08-17  29  	table->data = &state;
964c9dff009189 Alexander Popov 2018-08-17  30  	table->maxlen = sizeof(int);
964c9dff009189 Alexander Popov 2018-08-17  31  	ret = proc_dointvec_minmax(table, write, buffer, lenp, ppos);
964c9dff009189 Alexander Popov 2018-08-17  32  	state = !!state;
964c9dff009189 Alexander Popov 2018-08-17  33  	if (ret || !write || state == prev_state)
964c9dff009189 Alexander Popov 2018-08-17  34  		return ret;
964c9dff009189 Alexander Popov 2018-08-17  35
964c9dff009189 Alexander Popov 2018-08-17  36  	if (state)
964c9dff009189 Alexander Popov 2018-08-17  37  		static_branch_disable(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  38  	else
964c9dff009189 Alexander Popov 2018-08-17  39  		static_branch_enable(&stack_erasing_bypass);
964c9dff009189 Alexander Popov 2018-08-17  40
964c9dff009189 Alexander Popov 2018-08-17  41  	pr_warn("stackleak: kernel stack erasing is %s\n",
964c9dff009189 Alexander Popov 2018-08-17 @42  					state ? "enabled" : "disabled");
964c9dff009189 Alexander Popov 2018-08-17  43  	return ret;
964c9dff009189 Alexander Popov 2018-08-17  44  }
964c9dff009189 Alexander Popov 2018-08-17  45

:::::: The code at line 42 was first introduced by commit
:::::: 964c9dff0091893a9a74a88edf984c6da0b779f7 stackleak: Allow runtime disabling of kernel stack erasing

:::::: TO: Alexander Popov <alex.popov@linux.com>
:::::: CC: Kees Cook <keescook@chromium.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
