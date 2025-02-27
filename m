Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 527F11C6FF1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 27 Feb 2025 14:00:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740664856; cv=none; b=POtjX19CTI/IUScrWv37AgMORrKTogrew0xw28gg7GvhDqzu7t4d2t8NxFuPNCfTSZdoUFTksXUxOZeNb2qFqycXfIIrLT5clj5LxKzjZAdxvxdcbAuB7uDxbUfr6TZGZij+1yEzCmHHfRssuVu+5agZA25mm3x+KLByfJd/E2Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740664856; c=relaxed/simple;
	bh=OwFfqxNyaipLbQRdo+aAAeZeZ9an48SvVlbIHs5MFF0=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=LJxqhkaSeOwJK5OSoqRBgj6ng6SSOjiSkk8I1CPHPn2A/4BgCXt1Kkumzr6/B0o2C+xNm07w9WaOdhZjkGVWf38x1obgL3LDFsbTRFLGCmIUjBvzy4p7F/V1gf9cFBMgEdKjOf2XOAC4AMmx4H+370C1KICBbr+8Qhpt6nXKOb0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=DzyAdhCo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="DzyAdhCo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740664855; x=1772200855;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OwFfqxNyaipLbQRdo+aAAeZeZ9an48SvVlbIHs5MFF0=;
  b=DzyAdhCoqMfNVxOt9lotjbyjDKe1H2O4K5swlDEyMzIS02H3FA7zay0p
   xwpLT3G9/1T2qckQ2p9QPGWhE1/9FVvYjRkqZX9908ABPtW8zbkm/77Z6
   zOPhr6ws/VGz+oQoD46vw95CGaj9gaOSzh4W5dSaOyqF658C5+JgPkKkt
   3IDCsTRQWBWuh4s2JaJYikXv0D1vXNQkAuFGcKhrAlSFMqQhJvYu0t7Wt
   922mtfjxyoEuUSMcl0rmI7i9naQNAAyIjRx5jpfsRmszU/B3luK5JFwLQ
   +YE0tidTnMur48/aONtdfgTLge9+hkEFRV00cJM0qCSJePOU6dc547Ym5
   Q==;
X-CSE-ConnectionGUID: wSpYCATIQeypkVS78jMqrQ==
X-CSE-MsgGUID: HPP0E0vqQTKCMrTEg6KSJA==
X-IronPort-AV: E=McAfee;i="6700,10204,11358"; a="40793040"
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="40793040"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Feb 2025 06:00:52 -0800
X-CSE-ConnectionGUID: wJS+f5QoTqml0XaIYuzqlw==
X-CSE-MsgGUID: yQVvk2OmQASuodbfadxEiA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,319,1732608000"; 
   d="scan'208";a="121976538"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa003.jf.intel.com with ESMTP; 27 Feb 2025 06:00:51 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tneRU-000DRz-2z;
	Thu, 27 Feb 2025 14:00:48 +0000
Date: Thu, 27 Feb 2025 22:00:07 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev, Jens Axboe <axboe@kernel.dk>
Subject: [linux-next:master 6649/6931] io_uring/net.c:228
 io_compat_msg_copy_hdr() warn: unsigned 'tmp_iov.iov_len' is never less than
 zero.
Message-ID: <202502272105.kjTlPxVq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/next/linux-next.git master
head:   be5c7bbb3a64baf884481a1ba0c2f8fb2f93f7c3
commit: c30f89f1d08b205ab96aa09ce06549ba34bbba67 [6649/6931] io_uring/net: simplify compat selbuf iov parsing
config: x86_64-randconfig-161-20250227 (https://download.01.org/0day-ci/archive/20250227/202502272105.kjTlPxVq-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202502272105.kjTlPxVq-lkp@intel.com/

smatch warnings:
io_uring/net.c:228 io_compat_msg_copy_hdr() warn: unsigned 'tmp_iov.iov_len' is never less than zero.

vim +228 io_uring/net.c

   194	
   195	#ifdef CONFIG_COMPAT
   196	static int io_compat_msg_copy_hdr(struct io_kiocb *req,
   197					  struct io_async_msghdr *iomsg,
   198					  struct compat_msghdr *msg, int ddir)
   199	{
   200		struct io_sr_msg *sr = io_kiocb_to_cmd(req, struct io_sr_msg);
   201		struct compat_iovec __user *uiov;
   202		struct iovec *iov;
   203		int ret, nr_segs;
   204	
   205		if (iomsg->free_iov) {
   206			nr_segs = iomsg->free_iov_nr;
   207			iov = iomsg->free_iov;
   208		} else {
   209			iov = &iomsg->fast_iov;
   210			nr_segs = 1;
   211		}
   212	
   213		if (copy_from_user(msg, sr->umsg_compat, sizeof(*msg)))
   214			return -EFAULT;
   215	
   216		uiov = compat_ptr(msg->msg_iov);
   217		if (req->flags & REQ_F_BUFFER_SELECT) {
   218			if (msg->msg_iovlen == 0) {
   219				sr->len = iov->iov_len = 0;
   220				iov->iov_base = NULL;
   221			} else if (msg->msg_iovlen > 1) {
   222				return -EINVAL;
   223			} else {
   224				struct compat_iovec tmp_iov;
   225	
   226				if (copy_from_user(&tmp_iov, uiov, sizeof(tmp_iov)))
   227					return -EFAULT;
 > 228				if (tmp_iov.iov_len < 0)
   229					return -EINVAL;
   230				sr->len = tmp_iov.iov_len;
   231			}
   232	
   233			return 0;
   234		}
   235	
   236		ret = __import_iovec(ddir, (struct iovec __user *)uiov, msg->msg_iovlen,
   237					nr_segs, &iov, &iomsg->msg.msg_iter, true);
   238		if (unlikely(ret < 0))
   239			return ret;
   240	
   241		io_net_vec_assign(req, iomsg, iov);
   242		return 0;
   243	}
   244	#endif
   245	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
