Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 949FF1EF92A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 29 Oct 2024 03:09:40 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730171382; cv=none; b=q5RaY9lpDEiLBB0VgX95mJvCaz7LIsMFI+2QjPTnfTvU4tBG5NtnM5cxjFkgeMGYRqZ9nG2Lkp7Dx9NjJ6bxVHX3t1zw8g1QA3sNw6JehVZvaoSfUpN7wVcmQxbHgf/Nr2wq3aP/tAyJKZg2kTk+tfpr7JE9v1QWHXmO1lmQ0FA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730171382; c=relaxed/simple;
	bh=h7vG3qMYuEXQCRdNpjfUqa4bFo0DLNn+GZRwTy/QiRU=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=lTbHa15GtRGbslsfOU3olVwfpEORzGAoa5LVwoKnw+fMHHa+9+RtANEPLMijaCXIx4oqb9WfdFTKRDLqHuywP/s0Mo4BG60FQ2+0BnHSIQbey4ZWUU06fUsYhtl2+9mpgXSagsAfGgnP9TuxvTYSm8tI9NWuIXE+J++MkzN/32I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=SeSHOgm+; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="SeSHOgm+"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730171380; x=1761707380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=h7vG3qMYuEXQCRdNpjfUqa4bFo0DLNn+GZRwTy/QiRU=;
  b=SeSHOgm+qOTT3CIj1T1dXeDrz9gIU86/cwQKriAS6XEKxk8ebHxlZEJy
   qvasmlq5ZSsFRF3ELS9SOTZOSB554YswVmOywj6tu8sOLvj/W/0y2+f0d
   2DR7/vKawTYxzFAMsDyQHmmrAgRKQYJucD07XO9GaSpzOx9UNgesYs9tV
   vdI7m1QJP3m2nIWB0rzq6Li8Z/dKpOkl74+89EN5do0yAeuCdskd0eQxs
   EhUA52vV7+MMhsV+sk6PKb9a+DigTaC/rQR7C4vl15iJVYFC0/3YaNkso
   fSzwnpqzlBbv9oag59OwzNlIf9HQqP682EbMGeXpaUTdRqDP8UQ2DVbIa
   Q==;
X-CSE-ConnectionGUID: 4Ur1FU3ASFOKNTb9PggADQ==
X-CSE-MsgGUID: kdTry7liRjyVL0L/XSf7Sg==
X-IronPort-AV: E=McAfee;i="6700,10204,11239"; a="40409661"
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="40409661"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 28 Oct 2024 20:09:40 -0700
X-CSE-ConnectionGUID: nYbBl94wQWer7+hWRbkMJw==
X-CSE-MsgGUID: DNuIoNIPSL6zfgvyR8xUGg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,240,1725346800"; 
   d="scan'208";a="86373656"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 28 Oct 2024 20:09:39 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5cbx-000dBc-0d;
	Tue, 29 Oct 2024 03:09:37 +0000
Date: Tue, 29 Oct 2024 11:09:27 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-6.1 30/30]
 drivers/gpu/drm/udl/udl_cursor.c:69:49: sparse: sparse: cast to restricted
 __le32
Message-ID: <202410291127.IEc58dx4-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-6.1
head:   d9787b596cf182cf34ec02c3314d3fbb4b4b6443
commit: d9787b596cf182cf34ec02c3314d3fbb4b4b6443 [30/30] CHROMIUM: drm/udl: Port udl driver from ChromeOS 6.6 kernel with cursor plane support
config: x86_64-randconfig-122-20241028 (https://download.01.org/0day-ci/archive/20241029/202410291127.IEc58dx4-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241029/202410291127.IEc58dx4-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410291127.IEc58dx4-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/gpu/drm/udl/udl_cursor.c:69:49: sparse: sparse: cast to restricted __le32

vim +69 drivers/gpu/drm/udl/udl_cursor.c

    59	
    60	int udl_cursor_download(struct udl_cursor *cursor,
    61			const struct iosys_map *map)
    62	{
    63		uint32_t *src_ptr, *dst_ptr;
    64		size_t i;
    65	
    66		src_ptr = map->vaddr;
    67		dst_ptr = cursor->buffer;
    68		for (i = 0; i < UDL_CURSOR_BUF; ++i)
  > 69			dst_ptr[i] = cursor_blend_val32(le32_to_cpu(src_ptr[i]));
    70		return 0;
    71	}
    72	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
