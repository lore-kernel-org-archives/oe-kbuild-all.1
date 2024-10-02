Received: from mail2-relais-roc.national.inria.fr (mail2-relais-roc.national.inria.fr [192.134.164.83])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 217981448C5
	for <oe-kbuild-all@lists.linux.dev>; Wed,  2 Oct 2024 07:36:52 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.134.164.83
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1727854616; cv=none; b=LxnFLD1x2hqtEkldoQE0FG3KT6iHoUS5UZXSDL7Mgcyxw5587MpsKqZX47p/Fsy7qTd98GoOiC/h5WQ27vVc6sc63sSfNJD5mvUnfwkRh4CU0um4nc2LkRX6qCY3lEwhTV6XMPl5XBhK/TiPo54NcHcIlcTaSg5CQUiDg0jlqxM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1727854616; c=relaxed/simple;
	bh=fdPryQ5+EiCXRb2PtV1No5qL+Ahzy8usPEBtJdO6Og4=;
	h=Date:From:To:cc:Subject:Message-ID:MIME-Version:Content-Type; b=rMnp85f1P5m3xD68Tx8luVt9YuQom83wzfpu0FSo3DsmB8YY3M2xJFR8zZoLf3omWMKwxdkDrdngztwIP/UYRYeCYqPcEoLYRXQ6dsdZINFp6eATPWJCojAakYNSW1eALePHG0it4IuE2k0voq8mRQkWbJw/HaYoyU8JInsK3d4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr; spf=pass smtp.mailfrom=inria.fr; dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b=JYRnVhtY; arc=none smtp.client-ip=192.134.164.83
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="JYRnVhtY"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=4meZSvpSxgAJr0nz9WG36uihs3lhG6Ku5AZz1VZr80E=;
  b=JYRnVhtY3qB39fkCra86ZyC6uvhjcUMvaoYlb0oiUf1b/qhhXz7ZDhPe
   IIWLfjidMBP0C9ae7Z0PAB4aa/APiPzXKYuhEEuTFQS2Zy13x1tEI4Zy+
   5XsioMDVqRiij9EhftOdVXlIrfPXlwm/Lp/DJMiqjMFDwvQYxzgaYZulJ
   o=;
Authentication-Results: mail2-relais-roc.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.11,170,1725314400"; 
   d="scan'208";a="186411491"
Received: from dt-lawall.paris.inria.fr ([128.93.67.65])
  by mail2-relais-roc.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Oct 2024 09:36:51 +0200
Date: Wed, 2 Oct 2024 09:36:51 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Cristian Marussi <cristian.marussi@arm.com>
cc: Sudeep Holla <sudeep.holla@arm.com>, linux-kernel@vger.kernel.org, 
    oe-kbuild-all@lists.linux.dev
Subject: drivers/firmware/arm_scmi/raw_mode.c:924:8-24: WARNING:
 scmi_dbg_raw_mode_reset_fops: .write() has stream semantic; safe to change
 nonseekable_open -> stream_open. (fwd)
Message-ID: <1bb364cc-d167-4ef8-9d94-29b1774068f8@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

Hello,

I'm just forwarding this for your consideration. I don't know about this
issue.

julia

---------- Forwarded message ----------
Date: Wed, 2 Oct 2024 05:16:38 +0800
From: kernel test robot <lkp@intel.com>
To: oe-kbuild@lists.linux.dev
Cc: lkp@intel.com, Julia Lawall <julia.lawall@inria.fr>
Subject: drivers/firmware/arm_scmi/raw_mode.c:924:8-24: WARNING:
    scmi_dbg_raw_mode_reset_fops: .write() has stream semantic; safe to change
    nonseekable_open -> stream_open.

BCC: lkp@intel.com
CC: oe-kbuild-all@lists.linux.dev
CC: linux-kernel@vger.kernel.org
TO: Cristian Marussi <cristian.marussi@arm.com>
CC: Sudeep Holla <sudeep.holla@arm.com>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   e32cde8d2bd7d251a8f9b434143977ddf13dcec6
commit: b70c7996d4ffb2e02895132e8a79a37cee66504f firmware: arm_scmi: Make raw debugfs entries non-seekable
date:   6 months ago
:::::: branch date: 25 hours ago
:::::: commit date: 6 months ago
config: arm64-randconfig-r053-20241001 (https://download.01.org/0day-ci/archive/20241002/202410020543.MuCto6Eo-lkp@intel.com/config)
compiler: clang version 20.0.0git (https://github.com/llvm/llvm-project 7773243d9916f98ba0ffce0c3a960e4aa9f03e81)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Reported-by: Julia Lawall <julia.lawall@inria.fr>
| Closes: https://lore.kernel.org/r/202410020543.MuCto6Eo-lkp@intel.com/

cocci warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/raw_mode.c:924:8-24: WARNING: scmi_dbg_raw_mode_reset_fops: .write() has stream semantic; safe to change nonseekable_open -> stream_open.

vim +924 drivers/firmware/arm_scmi/raw_mode.c

3c3d818a9317a5 Cristian Marussi 2023-01-18  886
3c3d818a9317a5 Cristian Marussi 2023-01-18  887  static int scmi_dbg_raw_mode_open(struct inode *inode, struct file *filp)
3c3d818a9317a5 Cristian Marussi 2023-01-18  888  {
7860701d1e6e6e Cristian Marussi 2023-01-18  889  	u8 id;
3c3d818a9317a5 Cristian Marussi 2023-01-18  890  	struct scmi_raw_mode_info *raw;
3c3d818a9317a5 Cristian Marussi 2023-01-18  891  	struct scmi_dbg_raw_data *rd;
7860701d1e6e6e Cristian Marussi 2023-01-18  892  	const char *id_str = filp->f_path.dentry->d_parent->d_name.name;
3c3d818a9317a5 Cristian Marussi 2023-01-18  893
3c3d818a9317a5 Cristian Marussi 2023-01-18  894  	if (!inode->i_private)
3c3d818a9317a5 Cristian Marussi 2023-01-18  895  		return -ENODEV;
3c3d818a9317a5 Cristian Marussi 2023-01-18  896
3c3d818a9317a5 Cristian Marussi 2023-01-18  897  	raw = inode->i_private;
3c3d818a9317a5 Cristian Marussi 2023-01-18  898  	rd = kzalloc(sizeof(*rd), GFP_KERNEL);
3c3d818a9317a5 Cristian Marussi 2023-01-18  899  	if (!rd)
3c3d818a9317a5 Cristian Marussi 2023-01-18  900  		return -ENOMEM;
3c3d818a9317a5 Cristian Marussi 2023-01-18  901
3c3d818a9317a5 Cristian Marussi 2023-01-18  902  	rd->rx.len = raw->desc->max_msg_size + sizeof(u32);
3c3d818a9317a5 Cristian Marussi 2023-01-18  903  	rd->rx.buf = kzalloc(rd->rx.len, GFP_KERNEL);
3c3d818a9317a5 Cristian Marussi 2023-01-18  904  	if (!rd->rx.buf) {
3c3d818a9317a5 Cristian Marussi 2023-01-18  905  		kfree(rd);
3c3d818a9317a5 Cristian Marussi 2023-01-18  906  		return -ENOMEM;
3c3d818a9317a5 Cristian Marussi 2023-01-18  907  	}
3c3d818a9317a5 Cristian Marussi 2023-01-18  908
3c3d818a9317a5 Cristian Marussi 2023-01-18  909  	rd->tx.len = raw->desc->max_msg_size + sizeof(u32);
3c3d818a9317a5 Cristian Marussi 2023-01-18  910  	rd->tx.buf = kzalloc(rd->tx.len, GFP_KERNEL);
3c3d818a9317a5 Cristian Marussi 2023-01-18  911  	if (!rd->tx.buf) {
3c3d818a9317a5 Cristian Marussi 2023-01-18  912  		kfree(rd->rx.buf);
3c3d818a9317a5 Cristian Marussi 2023-01-18  913  		kfree(rd);
3c3d818a9317a5 Cristian Marussi 2023-01-18  914  		return -ENOMEM;
3c3d818a9317a5 Cristian Marussi 2023-01-18  915  	}
3c3d818a9317a5 Cristian Marussi 2023-01-18  916
7860701d1e6e6e Cristian Marussi 2023-01-18  917  	/* Grab channel ID from debugfs entry naming if any */
7860701d1e6e6e Cristian Marussi 2023-01-18  918  	if (!kstrtou8(id_str, 16, &id))
7860701d1e6e6e Cristian Marussi 2023-01-18  919  		rd->chan_id = id;
7860701d1e6e6e Cristian Marussi 2023-01-18  920
3c3d818a9317a5 Cristian Marussi 2023-01-18  921  	rd->raw = raw;
3c3d818a9317a5 Cristian Marussi 2023-01-18  922  	filp->private_data = rd;
3c3d818a9317a5 Cristian Marussi 2023-01-18  923
b70c7996d4ffb2 Cristian Marussi 2024-03-15 @924  	return nonseekable_open(inode, filp);
3c3d818a9317a5 Cristian Marussi 2023-01-18  925  }
3c3d818a9317a5 Cristian Marussi 2023-01-18  926

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
