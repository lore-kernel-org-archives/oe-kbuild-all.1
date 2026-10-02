Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 69612363095
	for <oe-kbuild-all@lists.linux.dev>; Fri,  2 Oct 2026 04:41:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1790916091; cv=none; b=DE0GSsIzGnsdyDB7g5RgtcLKTjJUPOFjbHdzD/gOt20a1jLiOAbUz40gfjlCm1a77Nyk4yMw8o9ehEGZb+TOlayL4s7Tjn5lezd25sH41RHB5ieNR9ey+PXcoyhw4mP5aUvHoucIradZg/lV4gqAjgvqgI5UQ91cmv65xVZQWEo=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1790916091; c=relaxed/simple;
	bh=beFvUP+bs/JKpLvE2evPYAaqXKiDZm5K5dlXBNXTkUY=;
	h=Date:From:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=jfnWvyc5S67T7mATLX3lDX4VZcMoUfjW3jhG2P465+8GqC/NwOTg4PB/bUo5buFr/l9f51yL1wGI+HquIVAp1ESBDVOp46oUhJIyOXlw4J1G9S4vpfrfyFGp6Ms6KjAcc4pxTi96BQL+Lpdbgah7+0qCPJGzRXgyf71IF9t4//s=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=bS6Llg/S; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="bS6Llg/S"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1790916089; x=1822452089;
  h=date:from:cc:subject:message-id:references:mime-version:
   in-reply-to;
  bh=beFvUP+bs/JKpLvE2evPYAaqXKiDZm5K5dlXBNXTkUY=;
  b=bS6Llg/SQMOOsqdl8iE41qiUdk08c6eyF0DyMFAJUzsv9L1YYWBbzTA8
   w+oICTS0FqM4q/8eXUD9ihY5SML/ECz6ZXzr70o9LTDvP8ImTATtoC2/e
   EArIsaSpfL7jk8a/uk7VMDDpXYQ0Zp/euB4lhd8SFTB5mECysh9i+Jo6l
   Dwi+FFkaEkVBED/jI1YM6x4jmHx82kAcwOC0TcUYMSTYCwrKbjLWn0gMd
   1qkcwec8e1cWiQiGdlySVZ35U8qeCVAydlvd4a4ILqEE11LJTe7545mlS
   TTjMwqIZe4Tb00gvNdQYIftDnQI9mbHlcGxNwoE8bhBqH9JKmpmNga7oP
   w==;
X-CSE-ConnectionGUID: fUzYy1T9RmKoUdsxMQxkwA==
X-CSE-MsgGUID: 7UHwRj8gSYagLJ3EZRgs/Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11922"; a="91546335"
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="91546335"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Oct 2026 21:41:27 -0700
X-CSE-ConnectionGUID: 1o3QH/GMQ/+k+RaSxHNwYg==
X-CSE-MsgGUID: lq5B9aKlT6mc8h31De6FAw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,135,1787036400"; 
   d="scan'208";a="302425599"
Received: from lkp-server01.sh.intel.com (HELO 462990a40a85) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 01 Oct 2026 21:41:26 -0700
Received: from kbuild by 462990a40a85 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xCV5I-00000000Se5-1ahe
	for oe-kbuild-all@lists.linux.dev;
	Fri, 02 Oct 2026 04:41:24 +0000
Date: Fri, 2 Oct 2026 12:41:20 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: tee: qcomtee: Track the object invocation context
Message-ID: <202610021234.WavLTcY0-lkp@intel.com>
References: <202610021234.WavLTcY0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202610021234.WavLTcY0-lkp@intel.com>

Hi Harshal,

kernel test robot noticed the following build warnings:



url:    https://github.com/intel-lab-lkp/linux/commits/Harshal-Dev/tee-qcomtee-Track-the-object-invocation-context/20261001-163233
base:   
patch link:    https://lore.kernel.org/r/202610021234.WavLTcY0-lkp%40intel.com
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20261002/202610021234.WavLTcY0-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261002/202610021234.WavLTcY0-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610021234.WavLTcY0-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/tee/qcomtee/call.c:397 function parameter 'origin' not described in 'qcomtee_object_invoke'
>> Warning: drivers/tee/qcomtee/call.c:397 function parameter 'origin' not described in 'qcomtee_object_invoke'

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
