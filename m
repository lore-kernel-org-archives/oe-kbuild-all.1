Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.8])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 04D8B2F744F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 22 Dec 2025 07:52:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.8
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766389940; cv=none; b=SyWklHzT1iW7prIuWgtgUVZ5Vsp/It13QDJG20VFZM27BfVHUbYtX0vVAhMwDOjj33E5/GKV8xPXs3x9rOnbuI63716N3Gn+gf+AAYGgcFzf8AVX1rrG/vY6NdpFBpflmW+0edUibHI5xzbL/KfzbyneHS2gZlqPhlP+w6SoHog=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766389940; c=relaxed/simple;
	bh=aIeAv2MwJ4eujyF0V/1PKXm/fyY9KcJzyv99OdcFQHo=;
	h=Date:From:To:Cc:Subject:Message-ID; b=UjYm+09QagDZ35M9ZbNr/6EXQ2g/D2xOOsbqKWafI7KjQ5k7rPdYnVHTYV27m4DcxRyyMwX/hV5lAubFN1tuki865/c0QB+CiUTMhoKeGVTON3DPjmBP+7tZADqTlK53bA9BB7mMxROxJ+JMg3T7m0QgQLHkxmpNwdXBTNoCOCg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HFOyiXOv; arc=none smtp.client-ip=192.198.163.8
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HFOyiXOv"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1766389939; x=1797925939;
  h=date:from:to:cc:subject:message-id;
  bh=aIeAv2MwJ4eujyF0V/1PKXm/fyY9KcJzyv99OdcFQHo=;
  b=HFOyiXOv8C0LLD1L1PlGac2y+ejl5AhVKqw699dJai0heFa6036PPtl6
   NB4bXK1PcCI3BKS5RHH17UdT2uzR13bfBBWtY/JZmM6OatbbehszcymVK
   ImrYVorYb9Zbb91pk5zGKAWwnKCVo1OfRuSWeaK/VCq0Biz9wTKcGSmT0
   Ah2zyV3SYvQ0d/DOBE3ddC+lz2GtBvYfjqCfJAgMDD8puFZZBzL5vZR/E
   0rpptCut5QJot5c1ZOPEn33oFiXqGMk29FYnlU/eeW3tqWMHNcYqTvog7
   ZeDPP+YcX8VEKnFclUOrbrSPyWvei00VVcsYuEO6+UwIOp/l8g9nfqtzO
   Q==;
X-CSE-ConnectionGUID: NIVUmJJ1ThKN/HCpn3uOXA==
X-CSE-MsgGUID: 576j6+mkTbKEcwktu9uCtA==
X-IronPort-AV: E=McAfee;i="6800,10657,11649"; a="85827450"
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="85827450"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by fmvoesa102.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Dec 2025 23:52:18 -0800
X-CSE-ConnectionGUID: 3EbejVgFQgm1esaB7UWxTw==
X-CSE-MsgGUID: bsvDpU2/QHWxrUJ8jOiSxg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,167,1763452800"; 
   d="scan'208";a="199372791"
Received: from lkp-server02.sh.intel.com (HELO dd3453e2b682) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 21 Dec 2025 23:52:17 -0800
Received: from kbuild by dd3453e2b682 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vXaiA-000000000EZ-1iM1;
	Mon, 22 Dec 2025 07:52:12 +0000
Date: Mon, 22 Dec 2025 15:51:42 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Peng Zhang <zhangpeng362@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-6.6 3544/3544] fs/userfaultfd.c:1809:23:
 sparse: sparse: invalid assignment: |=
Message-ID: <202512221517.71VoHBnY-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://gitee.com/openeuler/kernel.git OLK-6.6
head:   04473ee9ed912a16fff0d8846ad565bbf3d63c77
commit: 0214feb8f616acf62f9a6a2a131f0a1479b2b8af [3544/3544] mm/userswap: introduce UFFDIO_COPY_MODE_DIRECT_MAP
config: x86_64-randconfig-122-20251215 (https://download.01.org/0day-ci/archive/20251222/202512221517.71VoHBnY-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251222/202512221517.71VoHBnY-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512221517.71VoHBnY-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> fs/userfaultfd.c:1809:23: sparse: sparse: invalid assignment: |=
   fs/userfaultfd.c:1809:23: sparse:    left side has type restricted uffd_flags_t
   fs/userfaultfd.c:1809:23: sparse:    right side has type int
   fs/userfaultfd.c: note: in included file (through arch/x86/include/asm/tlbflush.h, arch/x86/include/asm/uaccess.h, include/linux/uaccess.h, ...):
   arch/x86/include/asm/pgtable.h:178:44: sparse: sparse: context imbalance in 'handle_userfault' - unexpected unlock

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
