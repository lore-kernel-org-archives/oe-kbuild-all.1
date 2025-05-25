Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 37A3A1F0995
	for <oe-kbuild-all@lists.linux.dev>; Sun, 25 May 2025 12:27:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748176068; cv=none; b=jjPrfVVDMVvB6J7WuXhH8KX8yKHZzTYPXR/3N8+uoccL3aGmuSlqualooWSGHAho4yJW6NANRTtaAdWaCQorXVh1b72af+eL2Qx17OawITXv74qlrbSHVw3n8d+kOFOKExU/MfeR/T/4xhhHX+qxscu8pNHQKtMlke50eP/NAIA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748176068; c=relaxed/simple;
	bh=YtKvaTFgQGc9ijcdk34CFyip+Rd77/IvITXaxuFYGGk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=SuqS1ddV4j1a5dLgUce8pQzitTelBbz5GhyKm3qdaBnNpvhUQKB5cd8tZHCvEkIvPJXf+rfWJT0KZ/VXzqO51gFN93F+5y2hlPkYiY3KxA5Px1JvuzlTk9zwfauC19epngSC2RBLBFtYi7+kuvtCslPH93nrXy21rifFNua1AUo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=URKpiIcJ; arc=none smtp.client-ip=192.198.163.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="URKpiIcJ"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748176067; x=1779712067;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=YtKvaTFgQGc9ijcdk34CFyip+Rd77/IvITXaxuFYGGk=;
  b=URKpiIcJt1Lm2sLVSW3ORU58K6Fb8TfcWJ0eCaZTRCQrCI1RhB2II9GI
   +i3pAZ2ZTASkI0Tld4S6dslaHWwmuXrNUFheynHOqt0CCsgZPKqIRD11G
   OanH61l9WjMNekq3QwdYPScEZ2etWj8+m5x0tEBOUW3uSE1+VpN1yXnJy
   8Q8D1D/EokKgUvF/zLf6JX8OowpYTjKrfRxNOoMusEs8+YreqLnnQO87k
   wRDRUXV7F0iA9t3jiMYrGk0N7vsH4nJUP+5BFf7TswmC4x7ADZ4caiDk/
   0yioq/jfudSwb1FJUlbJIooz22qN8mvM5vxkCLrc7G8ula/+i7QL4bSVV
   g==;
X-CSE-ConnectionGUID: OG9Y5vk1QH6ElJzhB5WqfQ==
X-CSE-MsgGUID: UDBVVSvvTPCfpuPWigp4cw==
X-IronPort-AV: E=McAfee;i="6700,10204,11444"; a="60824042"
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="60824042"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by fmvoesa103.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 25 May 2025 05:27:46 -0700
X-CSE-ConnectionGUID: VbUc+XSuSY638wSByRJJag==
X-CSE-MsgGUID: 6d/3bb1RTF2O04E+XcIFFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,313,1739865600"; 
   d="scan'208";a="141826690"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by orviesa009.jf.intel.com with ESMTP; 25 May 2025 05:27:45 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJAS6-000RoW-2D;
	Sun, 25 May 2025 12:27:42 +0000
Date: Sun, 25 May 2025 20:27:00 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sven:wip/smc-hid 21/22] drivers/input/misc/macsmc-hid.c:39:3:
 warning: label followed by a declaration is a C23 extension
Message-ID: <202505252031.4arFJwis-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/sven/linux.git wip/smc-hid
head:   85195bb074dd61b098eb62a878369dd5c4815832
commit: ee13e23037b7b78af00901c86613bf572b53baf3 [21/22] Input: macsmc-hid: New driver to handle the Apple Mac SMC buttons/lid
config: um-allmodconfig (https://download.01.org/0day-ci/archive/20250525/202505252031.4arFJwis-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250525/202505252031.4arFJwis-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505252031.4arFJwis-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/input/misc/macsmc-hid.c:39:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      39 |                 u8 button = (event >> 8) & 0xff;
         |                 ^
   drivers/input/misc/macsmc-hid.c:76:3: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
      76 |                 u8 lid_state = !!((event >> 8) & 0xff);
         |                 ^
   2 warnings generated.


vim +39 drivers/input/misc/macsmc-hid.c

    31	
    32	static int macsmc_hid_event(struct notifier_block *nb, unsigned long event, void *data)
    33	{
    34		struct macsmc_hid *smchid = container_of(nb, struct macsmc_hid, nb);
    35		u16 type = event >> 16;
    36	
    37		switch (type) {
    38		case SMC_EV_BTN:
  > 39			u8 button = (event >> 8) & 0xff;
    40			u8 state = !!(event & 0xff);
    41			switch (button) {
    42			case BTN_POWER:
    43			case BTN_TOUCHID:
    44				if (smchid->wakeup_mode) {
    45					if (state) {
    46						dev_info(smchid->dev, "Button wakeup\n");
    47						pm_wakeup_hard_event(smchid->dev);
    48					}
    49				} else {
    50					input_report_key(smchid->input, KEY_POWER, state);
    51					input_sync(smchid->input);
    52				}
    53				break;
    54			case BTN_POWER_HELD2:
    55				/*
    56				 * If we get here, we have about 4 seconds before forced shutdown.
    57				 * Try to do an emergency shutdown to make sure the NVMe cache is
    58				 * flushed. macOS actually does this by panicing (!)...
    59				 */
    60				if (state) {
    61					dev_crit(smchid->dev, "Triggering forced shutdown!\n");
    62					if (kernel_can_power_off())
    63						kernel_power_off();
    64					else /* Missing macsmc-reboot driver? */
    65						kernel_restart("SMC power button triggered restart");
    66				}
    67				break;
    68			case BTN_POWER_HELD1: /* power button held down; ignore */
    69				break;
    70			default:
    71				dev_warn(smchid->dev, "Unknown SMC button event: %04lx\n", event & 0xffff);
    72				break;
    73			}
    74			return NOTIFY_OK;
    75		case SMC_EV_LID:
    76			u8 lid_state = !!((event >> 8) & 0xff);
    77			if (smchid->wakeup_mode && !lid_state) {
    78				dev_info(smchid->dev, "Lid wakeup\n");
    79				pm_wakeup_hard_event(smchid->dev);
    80			}
    81			input_report_switch(smchid->input, SW_LID, lid_state);
    82			input_sync(smchid->input);
    83			return NOTIFY_OK;
    84		}
    85	
    86		return NOTIFY_DONE;
    87	}
    88	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
