Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A99A51E535
	for <oe-kbuild-all@lists.linux.dev>; Sun, 27 Oct 2024 23:24:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1730071443; cv=none; b=kW+P6NEjakJW8Ex5kuX9zU8KHttBU/dRU/MhmTypT+anJYgt6Gxjyzf8oDxMRYyWpLbsebGjr/kQckIFuyOmNbe4tyNY0x6nM2Qne1GrS4u6yvIuDPM68xHT/axi6v7LDu03+lrReSB17VBHVpDjHr2QfTgTs4z8uUMY7pGZKJQ=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1730071443; c=relaxed/simple;
	bh=RyrId1RUoAR1dZ6xvaHUJI6I36+8/6PfpumbI9/Rh+k=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=F+Hkh+QLR7m2fBNSI+OQ5hzrXs7/b9c8KZPyvEEl3NcHKaDW6kZk6yhBXXsZ2Pwg5ttc92t5X62v7WoMBh8Xd6ZrZd+f9tA9wx/UCbSIIiEA3VazUtxkFOQbXLYy4ZeV6sHbFGo1YtHxaNxkqfh+OhJsSlXSpoB62oH08wovqlo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=EgHNuflD; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="EgHNuflD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1730071441; x=1761607441;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=RyrId1RUoAR1dZ6xvaHUJI6I36+8/6PfpumbI9/Rh+k=;
  b=EgHNuflD2z2S8IDA2fAkyCvNcfj3FsJabfw+JvS4HXO+qVIOLsvy+g9j
   pHeIjqo9yH2+iYBis8wQWru1FWPlgjwlsKPs7x4KzIUKpYcnC7ESma6RU
   91ygxoSmwHL7XQ16OJ+9Vk9nZpdnckGnKI+mZuap03rEungwVBlYfZgBU
   yO0zFqmiU6TJlDr0ON31YvWFRU8U2ZH7eOgAj06lpEc2X0Gko1eU0nv++
   uorIvq6kYc8fq0Q8h6Na+EMg1PbtTR8d+oVpNnUeyJq0C9L3r7y7WWux8
   SUzEQS02XVXeD88TVnC46fhXcTcLPM8AmF1MCuy3WAEi8XSgL3TEjTDeN
   w==;
X-CSE-ConnectionGUID: +iY6WbljQSKabZTG8IdGBw==
X-CSE-MsgGUID: ETzJNfVRTt6LF64O+W7V8A==
X-IronPort-AV: E=McAfee;i="6700,10204,11238"; a="29568670"
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="29568670"
Received: from orviesa010.jf.intel.com ([10.64.159.150])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 27 Oct 2024 16:24:00 -0700
X-CSE-ConnectionGUID: FPS3VXXkQa6R/sTFr4gK0g==
X-CSE-MsgGUID: 4rCwPMHJTvaM7r7OJ1lvrQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.11,237,1725346800"; 
   d="scan'208";a="81349997"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by orviesa010.jf.intel.com with ESMTP; 27 Oct 2024 16:23:58 -0700
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t5Cc0-000b4e-0E;
	Sun, 27 Oct 2024 23:23:56 +0000
Date: Mon, 28 Oct 2024 07:23:40 +0800
From: kernel test robot <lkp@intel.com>
To: kernel@openeuler.org, Zheng Zengkai <zhengzengkai@huawei.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [openeuler:OLK-5.10 687/30000] kernel/locking/rwsem.o: warning:
 objtool: down_read_nested()+0x181: unreachable instruction
Message-ID: <202410280723.ss4XSDND-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://gitee.com/openeuler/kernel.git OLK-5.10
head:   412556141b3c12f2f160acc3a09a40c937837ee3
commit: 003a421b04ba85abaf24a92736dc47f76fda0803 [687/30000] disable OPTIMIZE_INLINING by default
config: x86_64-buildonly-randconfig-005-20241027 (https://download.01.org/0day-ci/archive/20241028/202410280723.ss4XSDND-lkp@intel.com/config)
compiler: clang version 19.1.2 (https://github.com/llvm/llvm-project 7ba7d8e2f7b6445b60679da826210cdde29eaf8b)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241028/202410280723.ss4XSDND-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202410280723.ss4XSDND-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> kernel/locking/rwsem.o: warning: objtool: down_read_nested()+0x181: unreachable instruction

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
