Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8AE126F16
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 15:11:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709651511; cv=none; b=WvsKmflc+eJtmjPqSfiCgCUiPXvlG8CUO6oz4+OwN9MOGR62ocTBLryqQdhOSLL3yFWsYwsRtTmK7l6IfSZ9t4M4qiPE2ZU68TxvpEdEHn4tBJuyzD/Ous4mtV+R/Zoed7FO/bWGRuxMrK3XCRRbHt+zzqSCTN9e/W8EWvtGY7Y=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709651511; c=relaxed/simple;
	bh=rxzl4Ps+EjvO9wgN/YgVl7qKXGnnsdnzo7TIHRaZlu4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B4Kf6ptXZ3dm10km0iYsGNyAgGskNCOvmoBrncVnIN+GetnegINRJ/8uNArUTxaGkHEXfo/q9ANoS5n2ZIjd5E3HRonKyjtBseNcX4k5ufeHX8OlYtZYnh89E9IdBcqAWrZawWCVgzZdA+MP+gExnzOqISvate6Tw0gr3pQHVyQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=FXrPjewo; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="FXrPjewo"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709651509; x=1741187509;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=rxzl4Ps+EjvO9wgN/YgVl7qKXGnnsdnzo7TIHRaZlu4=;
  b=FXrPjeworSnjtPqNIdTeBsOU8T4JqQF9Id/8CIyqTXO/iTTn6B2wFveo
   h+cWhx9QQxYTFNaZhpBgYbUemrL3vKSoYhxJzkRYSSRa4/W7jJDojvwjf
   V3AQep3p+cAGCvHkhJIVrDX8cP2m4CRmmAJURIdiuEeb5v3ipmRyH6FDL
   OTefT5FBMQhT2v94lTe/H9qeYRjThA7Fie+qphWKhGV8E8CZ7tc3Jj8UI
   Al9Ta9ZHnQW9J0P6VzNhB+fJ/NrbZIlk5KqpOoP8IN2Guh5NqV9j5d7b4
   yDdlbBAWMhH0ATyS+IrgPcP4k7Qn8S4f0KbDe03EfNP406NjC0caUoCMc
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="4069265"
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="4069265"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 07:11:48 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,205,1705392000"; 
   d="scan'208";a="9518946"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 05 Mar 2024 07:11:46 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhWSG-0003OT-0r;
	Tue, 05 Mar 2024 15:11:44 +0000
Date: Tue, 5 Mar 2024 23:11:26 +0800
From: kernel test robot <lkp@intel.com>
To: Vincent Whitchurch <vincent.whitchurch@axis.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	Ingo Molnar <mingo@kernel.org>
Subject: pcap-dbus.o:undefined reference to `dbus_message_demarshal'
Message-ID: <202403052336.y6DkUd8a-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Hi Vincent,

FYI, the error/warning still remains.

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   90d35da658da8cff0d4ecbb5113f5fac9d00eb72
commit: 10f4c9b9a33b7df000f74fa0d896351fb1a61e6a x86/asm: Fix build of UML with KASAN
date:   6 months ago
config: um-randconfig-r111-20240305 (https://download.01.org/0day-ci/archive/20240305/202403052336.y6DkUd8a-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240305/202403052336.y6DkUd8a-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403052336.y6DkUd8a-lkp@intel.com/

All errors (new ones prefixed by >>):

   /usr/bin/ld: arch/um/drivers/pcap.o: in function `dbus_write':
>> pcap-dbus.o:(.text+0x244ff): undefined reference to `dbus_message_demarshal'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x24515): undefined reference to `dbus_connection_send'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x2451e): undefined reference to `dbus_connection_flush'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x24526): undefined reference to `dbus_message_unref'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x24574): undefined reference to `dbus_error_free'
   /usr/bin/ld: arch/um/drivers/pcap.o: in function `dbus_read':
>> pcap-dbus.o:(.text+0x245c0): undefined reference to `dbus_connection_pop_message'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x245e2): undefined reference to `dbus_connection_pop_message'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x245f8): undefined reference to `dbus_connection_read_write'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x24662): undefined reference to `dbus_message_is_signal'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x2467e): undefined reference to `dbus_message_marshal'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x246e6): undefined reference to `dbus_free'
   /usr/bin/ld: arch/um/drivers/pcap.o: in function `dbus_cleanup':
>> pcap-dbus.o:(.text+0x2474c): undefined reference to `dbus_connection_unref'
   /usr/bin/ld: arch/um/drivers/pcap.o: in function `dbus_activate':
>> pcap-dbus.o:(.text+0x247f6): undefined reference to `dbus_connection_open'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x2480e): undefined reference to `dbus_bus_register'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x248fc): undefined reference to `dbus_bus_add_match'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x24904): undefined reference to `dbus_error_is_set'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x2494b): undefined reference to `dbus_bus_get'
   /usr/bin/ld: pcap-dbus.o:(.text+0x2497c): undefined reference to `dbus_error_free'
   /usr/bin/ld: pcap-dbus.o:(.text+0x2498d): undefined reference to `dbus_bus_add_match'
   /usr/bin/ld: pcap-dbus.o:(.text+0x24995): undefined reference to `dbus_error_is_set'
   /usr/bin/ld: pcap-dbus.o:(.text+0x249ce): undefined reference to `dbus_error_free'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x249da): undefined reference to `dbus_connection_unref'
   /usr/bin/ld: pcap-dbus.o:(.text+0x24a06): undefined reference to `dbus_bus_get'
   /usr/bin/ld: pcap-dbus.o:(.text+0x24a42): undefined reference to `dbus_error_free'
>> /usr/bin/ld: pcap-dbus.o:(.text+0x24a55): undefined reference to `dbus_connection_set_max_received_size'
   /usr/bin/ld: pcap-dbus.o:(.text+0x24a66): undefined reference to `dbus_connection_unref'
   /usr/bin/ld: pcap-dbus.o:(.text+0x24adc): undefined reference to `dbus_error_free'
   /usr/bin/ld: pcap-dbus.o:(.text+0x24b1a): undefined reference to `dbus_error_free'
   collect2: error: ld returned 1 exit status

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
