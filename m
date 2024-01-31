Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.20])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 56BD469DEB
	for <oe-kbuild-all@lists.linux.dev>; Wed, 31 Jan 2024 16:37:23 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=134.134.136.20
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706719045; cv=none; b=D4ej1Nlewwf1CLtew2dM5z4SvUP9pDFfwmZR9WOG5ovRyHu7/PzX4bsur99/Cpf4mu5yibTq+Lbord+Fzp2NEb4hnxLlg0t5DcmEyurBPF/gKZu2Sp4nt6kB17KdevJBT0U3rtPcDX/p6nfVdbHLy/GWXF4oVNkGsez9ampxDKg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706719045; c=relaxed/simple;
	bh=k3KqiPsMd1+XxLcPdbi6iUWDmPkh4oraMz/j5J4TRhc=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Y2XWsqaI4c5CvNSQsYQhc1fPITGGeadE8LPp0msL57hFelZkWdIHcNVHajgxSeHGb/Ckvc76nQyLxfNTUI4SjfJ5GgR9kBwcwf5e8OcwhCnCtiZN2E41CK7C674tAfoacuWkzQQBZyeI29Soat1R9u1us1j671P6aWwhIkRdBwo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=QQ55v0gf; arc=none smtp.client-ip=134.134.136.20
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="QQ55v0gf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1706719043; x=1738255043;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=k3KqiPsMd1+XxLcPdbi6iUWDmPkh4oraMz/j5J4TRhc=;
  b=QQ55v0gfveEzLt//9q0CsWDo9itvf/XN+lQ/eP9SQpDAEjqBfX5K5OWY
   LQ3Ap/mIgL1EjrxGctdXzcgahZxqouN1DVj6BU/dR4EJl+KJF9LDMon+Q
   FPqyQ4HlV5xRY9ea0R9I4k+qGcjGhhJ4r9mujhsTkbfQ7lGPop1lboyn5
   BEaGhC1IWuq8mdftJ6Dhj4/mTTPKwjzdrpWFoH+rMkyr1ry8yz/9kZ4tF
   fhN+NzwJcROWZ6aw31zan/bkH/DsdAMsV5Vd9rzBUrQE/6nYIzhPChU3/
   JQ0c0iZUMMA0JpViDSAM78Bq1zN0UXDGzR2FwAulXtZdvLIJ9d6VxAO2i
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10969"; a="394086765"
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="394086765"
Received: from orviesa001.jf.intel.com ([10.64.159.141])
  by orsmga101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 31 Jan 2024 08:37:22 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.05,231,1701158400"; 
   d="scan'208";a="36913855"
Received: from lkp-server02.sh.intel.com (HELO 59f4f4cd5935) ([10.239.97.151])
  by orviesa001.jf.intel.com with ESMTP; 31 Jan 2024 08:37:21 -0800
Received: from kbuild by 59f4f4cd5935 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rVDaQ-0001l8-28;
	Wed, 31 Jan 2024 16:37:18 +0000
Date: Thu, 1 Feb 2024 00:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Peng Zhang <zhangpeng362@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 1646/2894] fs/userfaultfd.c:1809:23: sparse:
 sparse: invalid assignment: |=
Message-ID: <202402010014.yQVRXXr1-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   f6f9abf1a5ef2fc559630c77b3570346dcd19d40
commit: 0214feb8f616acf62f9a6a2a131f0a1479b2b8af [1646/2894] mm/userswap: introduce UFFDIO_COPY_MODE_DIRECT_MAP
config: x86_64-randconfig-121-20240131 (https://download.01.org/0day-ci/archive/20240201/202402010014.yQVRXXr1-lkp@intel.com/config)
compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240201/202402010014.yQVRXXr1-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202402010014.yQVRXXr1-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/userfaultfd.c:1809:23: sparse: sparse: invalid assignment: |=
   fs/userfaultfd.c:1809:23: sparse:    left side has type restricted uffd_flags_t
   fs/userfaultfd.c:1809:23: sparse:    right side has type int
   fs/userfaultfd.c: note: in included file (through include/linux/rculist.h, include/linux/hashtable.h):
   include/linux/rcupdate.h:780:9: sparse: sparse: context imbalance in 'handle_userfault' - unexpected unlock
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
