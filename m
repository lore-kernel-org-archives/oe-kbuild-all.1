Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4DC511E261F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 18 Nov 2024 19:47:19 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731959241; cv=none; b=EfretS8KBpD0wI5uWBeNgaJir1OdGcZ7UrS8yRrvHFh/2TAl2pv2VdxK+zD3E+Az2HUV+zjl9Wx5jQzCWM6UMPRD1N4K6zF13blCaIo3OqIIp1HOCdL49v2ncEqJ0gj7FEcomkY+n6U7WTDt3lg5u8Y7Y53lBzP7DhhDHEWm9O0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731959241; c=relaxed/simple;
	bh=tThnFAlYG9UkQoAaaMuEesLDZif26hN4B57xrAKH8Es=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=TXmE7Y4e8T66cIQUtrnficqOE2PfLxFsOKLzpy1bBYnm3NchFyfcR1auxcTh6Sbq33AZbT03MS2bO6zJYZ78UQeWR+QgDSanJxIpQYlqyjkzmS9Oq6eAnbJbXYxNdXeRD80I4WBR+4XiTcyZOLjeyIL7txLWBagI8PmbwVUEOgU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=AnJELtpD; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="AnJELtpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731959239; x=1763495239;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=tThnFAlYG9UkQoAaaMuEesLDZif26hN4B57xrAKH8Es=;
  b=AnJELtpDDumN82WSnWe6kBihqYXPH24Y9Y8WIsQsQXa6sIYZgnGTytI2
   +2V4FVuj1m2p1LKu/qTCyV2ZHskxpFSMqCLUSIpwChwmw5m4BjrchztMJ
   VoP45Hd9+1G7PnJJPRceeMW3NRI/6N1qEiO/vsvXWxkGnclRPF4T2MtRV
   iysCDNkGpf35El6zTQK5gCwEJIba2Y0xJif9U8/5VmGj4Ga9bNRg+5Ntw
   FMKr9lhpdCGyaUVsLpzG+YcXmKDqckDxQw2+0VA6xKvTrWq8hPocF3dIK
   CU0rcDbxQExA6Y/c9emsz05umJsKEmrXW+iuYJ+pKgJeBfm2xIRGSD8If
   A==;
X-CSE-ConnectionGUID: SVHeGb7ISdSgbwfI2MMUJg==
X-CSE-MsgGUID: xOE+sMICSA+QyU2nxyk1Kw==
X-IronPort-AV: E=McAfee;i="6700,10204,11260"; a="32169266"
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="32169266"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 18 Nov 2024 11:47:17 -0800
X-CSE-ConnectionGUID: e/1yZg7/R1Ccj6e6YwXiGQ==
X-CSE-MsgGUID: 67jP3IjtS4+JXFsDMXimyA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,164,1728975600"; 
   d="scan'208";a="93397431"
Received: from lkp-server01.sh.intel.com (HELO 1e3cc1889ffb) ([10.239.97.150])
  by fmviesa003.fm.intel.com with ESMTP; 18 Nov 2024 11:47:16 -0800
Received: from kbuild by 1e3cc1889ffb with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tD7iL-0002c5-16;
	Mon, 18 Nov 2024 19:47:13 +0000
Date: Tue, 19 Nov 2024 03:46:32 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Peng Zhang <zhangpeng362@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1474/1474] fs/userfaultfd.c:1809:23: sparse:
 sparse: invalid assignment: |=
Message-ID: <202411190343.jV7BdOKI-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   8a039651010897592567f5751c4e706ab794e9c0
commit: 0214feb8f616acf62f9a6a2a131f0a1479b2b8af [1474/1474] mm/userswap: introduce UFFDIO_COPY_MODE_DIRECT_MAP
config: x86_64-randconfig-121-20241118 (https://download.01.org/0day-ci/archive/20241119/202411190343.jV7BdOKI-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241119/202411190343.jV7BdOKI-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411190343.jV7BdOKI-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/userfaultfd.c:1809:23: sparse: sparse: invalid assignment: |=
   fs/userfaultfd.c:1809:23: sparse:    left side has type restricted uffd_flags_t
   fs/userfaultfd.c:1809:23: sparse:    right side has type int
   fs/userfaultfd.c: note: in included file:
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   fs/userfaultfd.c: note: in included file (through include/linux/rculist.h, include/linux/hashtable.h):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'handle_userfault' - unexpected unlock
   fs/userfaultfd.c: note: in included file:
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
   include/linux/list.h:83:21: sparse: sparse: self-comparison always evaluates to true
--
   mm/userfaultfd.c: note: in included file (through include/linux/rbtree.h, include/linux/mm_types.h, include/linux/mmzone.h, ...):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_install_pte' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_zeropage' - unexpected unlock
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'mfill_atomic_pte_poison' - unexpected unlock
   mm/userfaultfd.c: note: in included file:
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode
>> include/linux/userfaultfd_k.h:66:45: sparse: sparse: restricted uffd_flags_t degrades to integer
>> include/linux/userfaultfd_k.h:67:32: sparse: sparse: incorrect type in argument 1 (different base types) @@     expected restricted uffd_flags_t [usertype] flags @@     got unsigned int enum mfill_atomic_mode mode @@
   include/linux/userfaultfd_k.h:67:32: sparse:     expected restricted uffd_flags_t [usertype] flags
   include/linux/userfaultfd_k.h:67:32: sparse:     got unsigned int enum mfill_atomic_mode mode

vim +1809 fs/userfaultfd.c

  1769	
  1770	static int userfaultfd_copy(struct userfaultfd_ctx *ctx,
  1771				    unsigned long arg)
  1772	{
  1773		__s64 ret;
  1774		struct uffdio_copy uffdio_copy;
  1775		struct uffdio_copy __user *user_uffdio_copy;
  1776		struct userfaultfd_wake_range range;
  1777		uffd_flags_t flags = 0;
  1778	
  1779		user_uffdio_copy = (struct uffdio_copy __user *) arg;
  1780	
  1781		ret = -EAGAIN;
  1782		if (atomic_read(&ctx->mmap_changing))
  1783			goto out;
  1784	
  1785		ret = -EFAULT;
  1786		if (copy_from_user(&uffdio_copy, user_uffdio_copy,
  1787				   /* don't copy "copy" last field */
  1788				   sizeof(uffdio_copy)-sizeof(__s64)))
  1789			goto out;
  1790	
  1791		ret = validate_unaligned_range(ctx->mm, uffdio_copy.src,
  1792					       uffdio_copy.len);
  1793		if (ret)
  1794			goto out;
  1795		ret = validate_range(ctx->mm, uffdio_copy.dst, uffdio_copy.len);
  1796		if (ret)
  1797			goto out;
  1798	
  1799		ret = -EINVAL;
  1800		if (uffdio_copy.mode & ~(UFFDIO_COPY_MODE_DONTWAKE |
  1801					 UFFDIO_COPY_MODE_WP |
  1802					 IS_ENABLED(CONFIG_USERSWAP) ?
  1803					 UFFDIO_COPY_MODE_DIRECT_MAP : 0))
  1804			goto out;
  1805		if (uffdio_copy.mode & UFFDIO_COPY_MODE_WP)
  1806			flags |= MFILL_ATOMIC_WP;
  1807		if (IS_ENABLED(CONFIG_USERSWAP) &&
  1808		    (uffdio_copy.mode & UFFDIO_COPY_MODE_DIRECT_MAP))
> 1809			flags |= MFILL_ATOMIC_DIRECT_MAP;
  1810		if (mmget_not_zero(ctx->mm)) {
  1811			ret = mfill_atomic_copy(ctx->mm, uffdio_copy.dst, uffdio_copy.src,
  1812						uffdio_copy.len, &ctx->mmap_changing,
  1813						flags);
  1814			mmput(ctx->mm);
  1815		} else {
  1816			return -ESRCH;
  1817		}
  1818		if (unlikely(put_user(ret, &user_uffdio_copy->copy)))
  1819			return -EFAULT;
  1820		if (ret < 0)
  1821			goto out;
  1822		BUG_ON(!ret);
  1823		/* len == 0 would wake all */
  1824		range.len = ret;
  1825		if (!(uffdio_copy.mode & UFFDIO_COPY_MODE_DONTWAKE)) {
  1826			range.start = uffdio_copy.dst;
  1827			wake_userfault(ctx, &range);
  1828		}
  1829		ret = range.len == uffdio_copy.len ? 0 : -EAGAIN;
  1830	out:
  1831		return ret;
  1832	}
  1833	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
