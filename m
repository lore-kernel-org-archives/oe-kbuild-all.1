Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 09345157A46
	for <oe-kbuild-all@lists.linux.dev>; Sun, 19 Jan 2025 08:43:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737276195; cv=none; b=TqnREP+VoAa9DAKB4wBNmy7aI2jE6YI5ygRn0kQIn7YH9WdgHmrq5TQXKO4ow6Is4OSlx2lK6TSr1HwSwvkHtCPjIvjCKlnWayHTrC3z+6KEdtyp4m+o0dz1WGQrJC6VWUFZ7GucgCdhF+oHIOWEWfH32TYYgIYLOtJ0+fZPOuU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737276195; c=relaxed/simple;
	bh=ioDFIkpUi3W8z92bio7ngYdrXQuY+FdwUZ4QsE+gW38=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=ncn311JaGIyhBl7DnZAXjJV9Dcjxx8P1hd8jl8KRgbKoomK5f0o5tvkbdwW/8vNOgrXbzULnVaOHLKrNtdLVnBomu/lkswdTp3daMomBZcTYbOyB8Lhpcjc/oU9y868KxcOqXIkS2CT87CedDRwAwzb66xkBiupsUMoEAVUpvVU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=lCbfWPhC; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="lCbfWPhC"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1737276193; x=1768812193;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=ioDFIkpUi3W8z92bio7ngYdrXQuY+FdwUZ4QsE+gW38=;
  b=lCbfWPhCqqcSK2NvLLeMoE/AjdismPINGfBCrlSIbEFi42SIpg6IX4pr
   tgDyvOWtbtVWtgQfHPh0B8yjzNKRV/ZzJfds4iTZkJexL8TqSCU8EGF+z
   U572A870iGwMamXWgPp7zp91wjokioa82vlO0LX3Wo/XGZHB3xr/S/hEH
   b22ALv8/nh0Y0qspjmGBvX2MuszhWE69WfYla/zXZIsWZWfZooGZHalwn
   i+HP4nJE1Ke1rTZmZFyP+p+H6gfF4xZ7L4aa/fUzW7YzPy5tih6RdE9x/
   LlqZ1AD0Lr1a39foCdRIucjjcsvg4MnVxt+68rTUvwgJctQeMsoGucW8x
   Q==;
X-CSE-ConnectionGUID: aq53PUp9Sgq7+RwhRvivUA==
X-CSE-MsgGUID: LrbWb1koSX6WM4iPPfC6iQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11319"; a="37567650"
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="37567650"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Jan 2025 00:43:12 -0800
X-CSE-ConnectionGUID: hZSM+zLwSHWhnMAOQ0AJeQ==
X-CSE-MsgGUID: mbEskWXWSiu7c6N52Dt8cA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,216,1732608000"; 
   d="scan'208";a="106001411"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 19 Jan 2025 00:43:12 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tZQth-000VG9-02;
	Sun, 19 Jan 2025 08:43:09 +0000
Date: Sun, 19 Jan 2025 16:42:38 +0800
From: kernel test robot <lkp@intel.com>
To: Jarkko Sakkinen <jarkko@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jarkko-tpmdd:v4l2-loopback 7/7]
 ./usr/include/linux/v4l2-loopback.h:21:2: error: unknown type name
 'uint32_t'
Message-ID: <202501191650.Hi77s08w-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jarkko/linux-tpmdd.git v4l2-loopback
head:   64dd521682c305567ffa99929a09e2ba285be52e
commit: 64dd521682c305567ffa99929a09e2ba285be52e [7/7] media: v4l2-loopback: Always allocate output_nr and change to uint32_t
config: i386-buildonly-randconfig-001-20250119 (https://download.01.org/0day-ci/archive/20250119/202501191650.Hi77s08w-lkp@intel.com/config)
compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250119/202501191650.Hi77s08w-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501191650.Hi77s08w-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from <built-in>:1:
>> ./usr/include/linux/v4l2-loopback.h:21:2: error: unknown type name 'uint32_t'
      21 |         uint32_t output_nr;
         |         ^
   1 error generated.

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
