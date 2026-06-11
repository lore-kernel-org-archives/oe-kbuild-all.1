Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BB5F03FFAD1
	for <oe-kbuild-all@lists.linux.dev>; Thu, 11 Jun 2026 16:51:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781196674; cv=none; b=kIk5iUSGYTld2xRY2ufRvygpZ+HlPR0f4pyE3o+xHatvDlQFkMbXr3AOS91GpFKXIZZfM+wMOI9OqiS6zQNcpDtyDohA1d7JWS+Q47PCrArGRs57Z4/E6b3Qvf96fyfy/Cb4ERhITbj4f9AaogDCEwRggOoNChn1ayixy8v0ymU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781196674; c=relaxed/simple;
	bh=vGX3znduISjkLdtqc4z3UfjkYXiCx3K4zBmezI7jPGU=;
	h=Date:From:To:Cc:Subject:Message-ID; b=U1xFkC8+gazIwiY5ewd3y+VCtYUg/5rV0bswBLLibFQKPgCTdMIj8EIHXikVaYCyzgAIDis757lhxU7L8VANInT46X1FurDWY4Jbz+9HiAI91gd6nyRZ+dGCcYh8Ydn2NFLuSO4/0CtOOnn7d76lVs/qgppYLgfvxtlEzkKrBo4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aEBCF3L4; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aEBCF3L4"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1781196673; x=1812732673;
  h=date:from:to:cc:subject:message-id;
  bh=vGX3znduISjkLdtqc4z3UfjkYXiCx3K4zBmezI7jPGU=;
  b=aEBCF3L4M8//igS1Xd4bcoG0Bd31G2g2R2oTxOjphgXIIylc65myb+/r
   15cuiZRqIz8fpdJVtTeb8VuyiUuLfV/7WIaj8ZIFz2UgekJ0IvoqzxDpt
   HaYHDqVBXumb4FZZ9PDkViZ1pxRzVKYjnsGlezKQMvN06Jqpqfw0BkNGx
   erA+sRZJDxktCOpvdTLGOOlkeLKMZqUxcKUwh7PGHKaYz/2h9ZCXX6Pzt
   et/4xUTQbKfN/FGa4HVk2fRsqeS6TAhfj436YXQcL5QH9QfrnHHHbobIc
   6D+CPgB2/E9X6uXF/91aRyL64Ufs/P5XA2zgWKxyy7nPOS7ppfNPg25lP
   Q==;
X-CSE-ConnectionGUID: IZAFpArTTS6bZIXI3Hobjg==
X-CSE-MsgGUID: T6Rn1FjxQSOIui/5fDsBoQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11813"; a="93123904"
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="93123904"
Received: from orviesa008.jf.intel.com ([10.64.159.148])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Jun 2026 09:51:11 -0700
X-CSE-ConnectionGUID: DV1ZmrIxS1qqsxlK39YaSA==
X-CSE-MsgGUID: 4ctlTyW6RbCmL0wi9HN6Rg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,199,1774335600"; 
   d="scan'208";a="246416791"
Received: from lkp-server01.sh.intel.com (HELO f0d55cb201f0) ([10.239.97.150])
  by orviesa008.jf.intel.com with ESMTP; 11 Jun 2026 09:51:09 -0700
Received: from kbuild by f0d55cb201f0 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wXicU-00000000NW6-0OE1;
	Thu, 11 Jun 2026 16:51:06 +0000
Date: Fri, 12 Jun 2026 00:50:50 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-2025-08 1/1]
 drivers/hwmon/occ/common.c:763:53: warning: diagnostic behavior may be
 improved by adding the 'format(printf, 7, 8)' attribute to the declaration of
 'occ_init_attribute'
Message-ID: <202606120022.L6q0k3sE-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://android.googlesource.com/kernel/common android16-6.12-2025-08
head:   49b3b23c7424ea4f41e853f74c4ad0f19694eac2
commit: bf41b962bd0e2659f741f82d404dbd165f3f5e3f [1/1] hwmon: (occ) Rework attribute registration for stack usage
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20260612/202606120022.L6q0k3sE-lkp@intel.com/config)
compiler: clang version 22.1.3 (https://github.com/llvm/llvm-project e9846648fd6183ee6d8cbdb4502213fcf902a211)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260612/202606120022.L6q0k3sE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202606120022.L6q0k3sE-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from <built-in>:3:
   In file included from include/linux/compiler_types.h:171:
   include/linux/compiler-clang.h:37:9: warning: '__SANITIZE_THREAD__' macro redefined [-Wmacro-redefined]
      37 | #define __SANITIZE_THREAD__
         |         ^
   <built-in>:353:9: note: previous definition is here
     353 | #define __SANITIZE_THREAD__ 1
         |         ^
>> drivers/hwmon/occ/common.c:763:53: warning: diagnostic behavior may be improved by adding the 'format(printf, 7, 8)' attribute to the declaration of 'occ_init_attribute' [-Wmissing-format-attribute]
     754 | static void occ_init_attribute(struct occ_attribute *attr, int mode,
         | __attribute__((format(printf, 7, 8))) 
     755 |         ssize_t (*show)(struct device *dev, struct device_attribute *attr, char *buf),
     756 |         ssize_t (*store)(struct device *dev, struct device_attribute *attr,
     757 |                                    const char *buf, size_t count),
     758 |         int nr, int index, const char *fmt, ...)
     759 | {
     760 |         va_list args;
     761 | 
     762 |         va_start(args, fmt);
     763 |         vsnprintf(attr->name, sizeof(attr->name), fmt, args);
         |                                                            ^
   drivers/hwmon/occ/common.c:754:13: note: 'occ_init_attribute' declared here
     754 | static void occ_init_attribute(struct occ_attribute *attr, int mode,
         |             ^
   2 warnings generated.


vim +763 drivers/hwmon/occ/common.c

   748	
   749	/*
   750	 * A helper to make it easier to define an occ_attribute. Since these
   751	 * are dynamically allocated, we cannot use the existing kernel macros which
   752	 * stringify the name argument.
   753	 */
   754	static void occ_init_attribute(struct occ_attribute *attr, int mode,
   755		ssize_t (*show)(struct device *dev, struct device_attribute *attr, char *buf),
   756		ssize_t (*store)(struct device *dev, struct device_attribute *attr,
   757					   const char *buf, size_t count),
   758		int nr, int index, const char *fmt, ...)
   759	{
   760		va_list args;
   761	
   762		va_start(args, fmt);
 > 763		vsnprintf(attr->name, sizeof(attr->name), fmt, args);
   764		va_end(args);
   765	
   766		attr->sensor.dev_attr.attr.name = attr->name;
   767		attr->sensor.dev_attr.attr.mode = mode;
   768		attr->sensor.dev_attr.show = show;
   769		attr->sensor.dev_attr.store = store;
   770		attr->sensor.index = index;
   771		attr->sensor.nr = nr;
   772	}
   773	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
