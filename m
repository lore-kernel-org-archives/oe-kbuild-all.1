Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E1663376F7
	for <oe-kbuild-all@lists.linux.dev>; Sun, 21 Jan 2024 16:07:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705853244; cv=none; b=bL/VCLkwADlXt3ytQYkMFiTzBkXv7VcV7si9liMVIdhyAUFKwxFb1WNghyw2ckSz1Hjq/DaFMcdZgNvp+Qa/OCBPJZ2cDlNjOYfWvtMw7xq+Rdkaos7GIl5q0yNSKMdETZTI88rtZpXy1wh5P/0uqaqOplg/qoBja1iynsppbNE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705853244; c=relaxed/simple;
	bh=zklDgEBaq7rWqauxnUJGwrhFfIWRBjzQMz1rGYljloE=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=DHqSraAhPt4KU3Fo5VZbJvmWPbtu4/P33YeCHyMOGTVw41QwtyoqN5mZLZm5mEKwYBT6WjN89nwEdUXNMAfQ8zToH8qlJSUnDm2a9OBYP4Ii0sVZ9FeiTDdYb5nT0BW0SUAPLiNzoE/hfVE0CxfGdlMtNLHsBxocmLkAGGc5EBA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=gFBw55Su; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="gFBw55Su"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1705853242; x=1737389242;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=zklDgEBaq7rWqauxnUJGwrhFfIWRBjzQMz1rGYljloE=;
  b=gFBw55SulwAwbX6ftSNzuWVvQzAimHtPabaYf3ZjmoqWbBdGDolXYFU5
   ZN518Ckendz52IuENROeXaQ5+pZoIpU6QtV0wqeca4OoxTDlhEUTJXD+W
   UZTR48SxLSdS/fvFznSBK8y/0flELrAkEs+EOKAvbXpuoCmIk7GnX3qfk
   O7t36CkgZCaIoeGk4XoJKau0lWrKPKlf2IEf6kSoKOG/8n/gWmLsXITln
   7PWk0qc46yua71Cceyua0fn+DEJR/p0GKu/mFCZqB9NWOLw1CQuIh1sn/
   tFPnnq9GHQtPYYEjOfRpnH65zAMfoOY7k6WzrFwpQ7/4fdxoWQkcFXy+T
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="8418901"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="8418901"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 21 Jan 2024 08:07:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10960"; a="778387594"
X-IronPort-AV: E=Sophos;i="6.05,210,1701158400"; 
   d="scan'208";a="778387594"
Received: from lkp-server01.sh.intel.com (HELO 961aaaa5b03c) ([10.239.97.150])
  by orsmga007.jf.intel.com with ESMTP; 21 Jan 2024 08:07:15 -0800
Received: from kbuild by 961aaaa5b03c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rRaLo-00061o-2O;
	Sun, 21 Jan 2024 16:07:12 +0000
Date: Mon, 22 Jan 2024 00:06:35 +0800
From: kernel test robot <lkp@intel.com>
To: "Jiri Slaby (SUSE)" <jirislaby@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jirislaby:devel 65/89] drivers/tty/vt/vt.c:2135: warning: Enum
 value 'ESANSI_first' not described in enum 'vc_ctl_state'
Message-ID: <202401220052.JFNOJs7z-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/jirislaby/linux.git devel
head:   1cee1f612a81347ee77b4e6687c2ddff726b79f0
commit: 44571603ef85852fc8217b8a924f6c441942d170 [65/89] simplify ansi_control_string()
config: i386-buildonly-randconfig-003-20240121 (https://download.01.org/0day-ci/archive/20240122/202401220052.JFNOJs7z-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240122/202401220052.JFNOJs7z-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202401220052.JFNOJs7z-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESnormal' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESesc' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESsquare' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESgetpars' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESfunckey' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'EShash' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESsetG0' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESsetG1' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESpercent' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'EScsiignore' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESnonstd' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESpalette' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESosc' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2135: warning: Enum value 'ESANSI_first' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESapc' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESpm' not described in enum 'vc_ctl_state'
   drivers/tty/vt/vt.c:2135: warning: Enum value 'ESdcs' not described in enum 'vc_ctl_state'
>> drivers/tty/vt/vt.c:2135: warning: Enum value 'ESANSI_last' not described in enum 'vc_ctl_state'


vim +2135 drivers/tty/vt/vt.c

^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds    2005-04-16  2093  
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2094) /**
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2095)  * enum vc_ctl_state - control characters state of a vt
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2096)  *
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2097)  * ESnormal:		initial state, no control characters parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2098)  * ESesc:		ESC parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2099)  * ESsquare:		CSI parsed -- parameters/modifiers expected
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2100)  * ESgetpars:		CSI parsed -- reading parameters
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2101)  * ESfunckey:		CSI [ parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2102)  * EShash:		ESC # parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2103)  * ESsetG0:		ESC ( parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2104)  * ESsetG1:		ESC ) parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2105)  * ESpercent:		ESC % parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2106)  * EScsiignore:		CSI [0x20-0x3f] parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2107)  * ESnonstd:		OSC parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2108)  * ESpalette:		OSC P parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2109)  * ESosc:		OSC [0-9] parsed
44571603ef8585 drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2110)  * ESANSI_first:	first state for ignoring ansi control sequences
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2111)  * ESapc:		ESC _ parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2112)  * ESpm:		ESC ^ parsed
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2113)  * ESdcs:		ESC P parsed
44571603ef8585 drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2114)  * ESANSI_last:		last state for ignoring ansi control sequences
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2115)  */
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2116) enum vc_ctl_state {
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2117) 	ESnormal,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2118) 	ESesc,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2119) 	ESsquare,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2120) 	ESgetpars,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2121) 	ESfunckey,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2122) 	EShash,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2123) 	ESsetG0,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2124) 	ESsetG1,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2125) 	ESpercent,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2126) 	EScsiignore,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2127) 	ESnonstd,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2128) 	ESpalette,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2129) 	ESosc,
44571603ef8585 drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2130) 	ESANSI_first = ESosc,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2131) 	ESapc,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2132) 	ESpm,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2133) 	ESdcs,
44571603ef8585 drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19  2134) 	ESANSI_last = ESdcs,
19863f2c7b6a1c drivers/tty/vt/vt.c Jiri Slaby (SUSE  2024-01-19 @2135) };
^1da177e4c3f41 drivers/char/vt.c   Linus Torvalds    2005-04-16  2136  

:::::: The code at line 2135 was first introduced by commit
:::::: 19863f2c7b6a1c64be5feef084c2fdcc3cffa637 name, reflow and document enum vc_ctl_state

:::::: TO: Jiri Slaby (SUSE) <jirislaby@kernel.org>
:::::: CC: Jiri Slaby (SUSE) <jirislaby@kernel.org>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
