Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=198.175.65.14
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1793639696;
	b=Yf9OGQPCTTI6vNguefrIJztZK7z0TfijwlS8KBW3GJXLA3XEKEG1aYYwIELiVxS9m4BK
	 cZwMzC+B1hGXZ9GLugTSsZq0CkN78QmQNvkE0VGSUzzi4Ef9r9R2o+Xh57P/njApxWObm
	 /FaUDea2kgfWFjtDKZbaVtZk8/n6GUZeUUAO55BA3NfHaPTx3rAUycb+t7b0dItq1INDf
	 iVBNf/GV9+0gqi8c7Eyt27hY6WUhmpCIEzIYcVHmCq0QZbN6RhTgDhPWSHPNOpxJPvh8r
	 Urk7raqhfdPXB9qPlnZRWi01hqSaf+lC9cq+yOlE1iBLxzB7f0MgM5KqWCkdW1E45GQ==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793639696;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:References:MIME-Version:Content-Type:
	 Content-Disposition:In-Reply-To;
	bh=VfgSp3cgsfqtOO3clcrfty+qD2Zy4jlWdWJ9kVouLvk=;
	b=W7ovG876/FTAZIKqcvEa4KectKdw2r8t0+sbLD0F063vpigdx5mnY+6urm3QfSeGfra0
	 mRDeejBxJ8FlukunAJogypXKzCve+lOMKDGYLrDa6uCgqFhnSuOuiaW+BLynRrVDBf60g
	 OvKYwPG2oQihkk8LFXj2G/u45n+kgt0TiCnpeE/SBITFYietsYwLJOFE9ac/lQDoYxPyu
	 sk+om3rCIYFDVRhmZkzDvUhf99vaNb1rmmINZlPCLALuU6syG3Sr4KVHWC4Je0//dyLSd
	 GUAQ7jZ6Efvwv3b5kBQN5yQD9foG9v5+RR48G4qu05H4LiPgckzvlRaAMHK9TtUx3Dg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=neXz4T74;
	arc=none smtp.remote-ip=198.175.65.14
Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.14])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD537606A917
	for <oe-kbuild-all@lists.linux.dev>; Mon,  2 Nov 2026 17:14:54 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org BD537606A917
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=neXz4T74
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1793639695; x=1825175695;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=nqQzviCw5HLUlkzPdxIrNo2VwlVDrJt0aA/SRwJ9iM0=;
  b=neXz4T74KxmIE582rk9cxiAfniaxgwSeYPS2lWldPNXH+p1gN+jkRN11
   oeDMhMHhGYqFNWhjmcGz7WWGcQv3gobuka3i4QxVm7YUPxDdmQUKnVw5k
   8rgLQVZNA4HiNVAZ6n/5qK+ga0CIbQMypwc64gh9qyUz/8dIAIqRT2D6N
   3mG8+nMTHNR8LFGxKuzUH21PRHpkYGOIMBlQG3hZQXk/j3O9Mj/Pt/MSH
   8dAPNXboaUq5yCbnp1V8U/E8iQ9vA2qIGwhCBXFr+9nznmFnArdHX1MfZ
   TIi07miO3GTVNlkch95xuRnGHN1fkze7vLg6BTq9GD/92+lZWPvfWoufE
   A==;
X-CSE-ConnectionGUID: PlytDc9wRwqMq9PQAT5N+Q==
X-CSE-MsgGUID: /joE85QeQO61rFb2cW99Rg==
X-IronPort-AV: E=McAfee;i="6800,10657,11954"; a="2225041"
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="2225041"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 Nov 2026 09:14:54 -0800
X-CSE-ConnectionGUID: TEisa5mfRCas7EY00UyDFA==
X-CSE-MsgGUID: K8D+DgofRzKhGujlSLaQqQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,191,1787036400"; 
   d="scan'208";a="6055091"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 02 Nov 2026 09:14:52 -0800
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xNvcP-00000000hYa-2VbF;
	Mon, 02 Nov 2026 17:14:49 +0000
Date: Tue, 3 Nov 2026 01:14:24 +0800
From: kernel test robot <lkp@intel.com>
To: "Baorui.Liu" <baorliu@amd.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, Len Brown <lenb@kernel.org>,
	linux-acpi@vger.kernel.org, linux-kernel@vger.kernel.org,
	acpica-devel@lists.linuxfoundation.org,
	kernel test robot <lkp@intel.com>, "Baorui . Liu" <baorliu@amd.com>
Subject: Re: [PATCH v6] ACPI: button: Report wakeup key only for power button
 wakeups
Message-ID: <202611030112.cVsBZFFE-lkp@intel.com>
References: <20261102091049.856-1-baorliu@amd.com>
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20261102091049.856-1-baorliu@amd.com>

Hi Baorui.Liu,

kernel test robot noticed the following build errors:

[auto build test ERROR on rafael-pm/linux-next]
[also build test ERROR on rafael-pm/bleeding-edge linus/master v7.3 next-20261030]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Baorui-Liu/ACPI-button-Report-wakeup-key-only-for-power-button-wakeups/20261102-171049
base:   https://git.kernel.org/pub/scm/linux/kernel/git/rafael/linux-pm.git linux-next
patch link:    https://lore.kernel.org/r/20261102091049.856-1-baorliu%40amd.com
patch subject: [PATCH v6] ACPI: button: Report wakeup key only for power button wakeups
config: parisc64-defconfig (https://download.01.org/0day-ci/archive/20261103/202611030112.cVsBZFFE-lkp@intel.com/config)
compiler: hppa64-linux-gcc (GCC) 16.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261103/202611030112.cVsBZFFE-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202611030112.cVsBZFFE-lkp@intel.com/

All errors (new ones prefixed by >>):

   In file included from drivers/gpu/drm/nouveau/nouveau_connector.c:27:
>> include/acpi/button.h:28:15: error: unknown type name 'bool'
      28 | static inline bool acpi_sleep_pwr_btn_wakeup_pending(void)
         |               ^~~~
   include/acpi/button.h:1:1: note: 'bool' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
     +++ |+#include <stdbool.h>
       1 | /* SPDX-License-Identifier: GPL-2.0 */
   include/acpi/button.h: In function 'acpi_sleep_pwr_btn_wakeup_pending':
>> include/acpi/button.h:30:16: error: 'false' undeclared (first use in this function)
      30 |         return false;
         |                ^~~~~
   include/acpi/button.h:30:16: note: 'false' is defined in header '<stdbool.h>'; this is probably fixable by adding '#include <stdbool.h>'
   include/acpi/button.h:30:16: note: each undeclared identifier is reported only once for each function it appears in


vim +/bool +28 include/acpi/button.h

    17	
    18	/*
    19	 * Set in acpi_suspend_enter() when the fixed power-button status bit is
    20	 * observed (IRQ-disabled context). Consumed by the button driver on resume
    21	 * so KEY_WAKEUP can be reported without calling into the button driver from
    22	 * that early path. Implemented in sleep.c (built-in); safe when
    23	 * CONFIG_ACPI_BUTTON=m.
    24	 */
    25	#ifdef CONFIG_ACPI_SYSTEM_POWER_STATES_SUPPORT
    26	bool acpi_sleep_pwr_btn_wakeup_pending(void);
    27	#else
  > 28	static inline bool acpi_sleep_pwr_btn_wakeup_pending(void)
    29	{
  > 30		return false;
    31	}
    32	#endif
    33	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
