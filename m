Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0057F5256
	for <oe-kbuild-all@lists.linux.dev>; Tue,  5 Mar 2024 17:17:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709659077; cv=none; b=DQjEd9Mu5T/olWOuW8YG5dGJc6ueAhCaUpVDO2453Endtfm6EqBv1YNAD/d5OmWaMbkp4jNL3Ftc8vOHR8ooXdnpyxya5kIm/PFa+6FERL+9hBcyHMffbTA3kog6JC0L6OAHyiRbrSr90ReTJvHlVk8AbMtjWwm/4Hf0QQ9f6bc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709659077; c=relaxed/simple;
	bh=OfPlNi9zAqC9aJ1YnadwGYkXAhCiuY23YEMeVbjeigg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=J8FsUxww90iXijx4kbMOJn3byeGwTIonWfnijjqdSLXWSPnykdRNQ0u7lBmEb22Vd1MzQ92wScKosYgWZ/2jT9q9r0tyo/DKZp9XtMgw/B1r2e7WLK0rP0RRnDaB0i823jpMVR0PGE6MgVEAjtygfjEPVb0O015+WkuyFiXyqAc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=RT0s+sRf; arc=none smtp.client-ip=192.198.163.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="RT0s+sRf"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709659076; x=1741195076;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=OfPlNi9zAqC9aJ1YnadwGYkXAhCiuY23YEMeVbjeigg=;
  b=RT0s+sRf0fXwLZpZFib7fOKmTGBd5YIkZOpcxo8Fs2tjzw7dRdFThu2k
   p6BcZcM6RDwVoUM0LxZDWzj4fWbZjuiXjGcdSlLXza0t+VPmDK/qPNz6z
   PE4Ci1l3Ws8O34d0L/pguHRIjQcXQBUIUkbnq52BtPCaW3sdz+gRUY6le
   A1OXTsCvUEqhTgJ218pjiuC9h1O4Ohpm9gydXZVro0FgKB/NUMuRCQG4t
   hkpCahCseFOsJObrwmPIzjwHdDqZoNDfCpJdDSBVu9eSutw4Lm0yQSxwr
   j/aHgbvrSLJHSMNfZ0mICLzxEr4SolZOQtNbW+fMJfuW+Fra1PYbb6lf2
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,11003"; a="15630240"
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="15630240"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa104.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Mar 2024 09:17:54 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.06,206,1705392000"; 
   d="scan'208";a="14108547"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 05 Mar 2024 09:17:53 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1rhYQI-0003Vd-1h;
	Tue, 05 Mar 2024 17:17:50 +0000
Date: Wed, 6 Mar 2024 01:16:51 +0800
From: kernel test robot <lkp@intel.com>
To: Pavel Begunkov <asml.silence@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [isilence:zc/rx-latest 39/43] sparc64-linux-ld: zc_rx.c:undefined
 reference to `tcp_recvmsg'
Message-ID: <202403060147.iLj6XJSH-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/isilence/linux zc/rx-latest
head:   5af93e6de5f9e457b5ee2106ddaa3dd019b6a6f2
commit: 1154ef787549a4e3e0059aa1039c5793d4af6d90 [39/43] io_uring: add io_recvzc request
config: sparc64-randconfig-002-20240305 (https://download.01.org/0day-ci/archive/20240306/202403060147.iLj6XJSH-lkp@intel.com/config)
compiler: sparc64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240306/202403060147.iLj6XJSH-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403060147.iLj6XJSH-lkp@intel.com/

All errors (new ones prefixed by >>):

   sparc64-linux-ld: io_uring/zc_rx.o: in function `io_zc_rx_recv':
   zc_rx.c:(.text+0x14b8): undefined reference to `tcp_recvmsg'
>> sparc64-linux-ld: zc_rx.c:(.text+0x14bc): undefined reference to `tcp_recvmsg'
>> sparc64-linux-ld: zc_rx.c:(.text+0x1504): undefined reference to `tcp_read_sock'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
