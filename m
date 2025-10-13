Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D108B26FDA8
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Oct 2025 12:27:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1760358443; cv=none; b=r6A5DLfy0dvY/bPzWDajkT5146QErEAwWa4LGjRUqHV3ugsf26tQd+c4z9k9q7MczMLDqrzLqkFI7ptwE/fowpWjRY9GUs/bH9HCZyiRAHhJfpzdf9Lc+Y6VA0VCs3Su/l6jF8o8THSyDzB8Zymk2JjZnpNlFxx1of8pp5sWqGw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1760358443; c=relaxed/simple;
	bh=3Xq2OzFNSUT2clDk6VJnsBcSvo0oQInIwnEuEeayWM8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=aivd3MR3iN/dLUF0RTrXIUQYbonxF40MPcA1o8+LUpKbUSobRD4I/xbM2Msmss8zY+AYNbu/4WnxyM8uG5qvb8inXI7nWLTRWqWurF3Hyxec9wGuRZDpxW9bCUypuVen/a3v+or35agX0YDSaGaCifA5Mwu+hgZPz0NXJcD3Z7M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=GLpuxaVj; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="GLpuxaVj"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1760358442; x=1791894442;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=3Xq2OzFNSUT2clDk6VJnsBcSvo0oQInIwnEuEeayWM8=;
  b=GLpuxaVjhUTugmWpr8/iaRrTwAj1V5eDWNAcA7Mr4hm4oMu8HR+IAVNf
   z0vDIfyHL27xzVoENuNnbMUZfqu2836C9aQCayMp8yyoUpnozO1BL6lqa
   JUC+H1l145BS6RIS0Jnz6OEGBXw22GuaFwnz+coZbT6sAiu4/DQk1i68m
   ld6kyJOqgCtOLYVWqeg2Cfu5itWC3BreNex85EA+HtWvaSLa0SbQz84iD
   oYkEsjtEIjAflkoLATVW5FMjTWbOIksIHWjdmwszxoQcbdo2Knq2fkI9Z
   YBW5zt5oaUmoNrrq6Efu7EVS1jDP8Rn1Ub7HjE98dFmoTszpUP1IO7uiO
   Q==;
X-CSE-ConnectionGUID: OB92i/MhQXCA+EX+8mkx+w==
X-CSE-MsgGUID: YRxg52VVTPuA6v93YLE7pQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11580"; a="62528670"
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="62528670"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Oct 2025 05:27:19 -0700
X-CSE-ConnectionGUID: r8mSLnxlTVuJO3cN4oBogA==
X-CSE-MsgGUID: CMrAoPp3TvekaD5IlrMaZw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,225,1754982000"; 
   d="scan'208";a="186001674"
Received: from igk-lkp-server01.igk.intel.com (HELO 0e586ad5e7f7) ([10.91.175.65])
  by fmviesa005.fm.intel.com with ESMTP; 13 Oct 2025 05:27:18 -0700
Received: from kbuild by 0e586ad5e7f7 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1v8He0-000000008sI-26nA;
	Mon, 13 Oct 2025 12:27:16 +0000
Date: Mon, 13 Oct 2025 14:26:48 +0200
From: kernel test robot <lkp@intel.com>
To: Frank Wunderlich <frank-w@public-files.de>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [frank-w-bpi-r2-4.14:6.18-rc 4/110]
 utils/firmware/zjy-ips130-v20.bin: warning: ignored by one of the .gitignore
 files
Message-ID: <202510121305.hm37Yu0W-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/frank-w/BPI-R2-4.14 6.18-rc
head:   936e993c16c5c695eb2ce063a5a11f122a580727
commit: a0b075641fafa2bbcc54e1e35dd3efd08dabd21a [4/110] firmware: add daniels firmware for spi-display
config: x86_64-kexec (https://download.01.org/0day-ci/archive/20251012/202510121305.hm37Yu0W-lkp@intel.com/config)
compiler: clang version 20.1.8 (https://github.com/llvm/llvm-project 87f0227cb60147a26a1eeb4fb06e3b505e9c7261)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251012/202510121305.hm37Yu0W-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510121305.hm37Yu0W-lkp@intel.com/

All warnings (new ones prefixed by >>):

   Documentation/.renames.txt: warning: ignored by one of the .gitignore files
>> utils/firmware/zjy-ips130-v20.bin: warning: ignored by one of the .gitignore files

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
