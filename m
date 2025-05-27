Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 43DEFFC0B
	for <oe-kbuild-all@lists.linux.dev>; Tue, 27 May 2025 00:42:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.7
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1748306524; cv=none; b=Me+otCzr2P42ZjWcuhNaJlAnHPSlZ0H6GprE/n7fVZ0pdLmlL+LXxM6Jv5pfLgx9hi5T0pDcRDKa6Jj7XRynezIv+X7SYHQAFtvV8wsoRitMsR1AnELU6StFYuWX4IVuTcsgT6wINvoPKPnclXmUZDptqS17Co8DctdiWGgeX78=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1748306524; c=relaxed/simple;
	bh=koTTMpCnx2yU+RxxlY9kENsOZAnnE0YvRuXb43qdjv8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=RmXN0GOcDwxeFMp4OjJf4EceevDkb7znuZudN8HUNyX9SCVrYgidTlVOcLmDST79yzqaNANOfQ1KmNmkKX2ktdiP+hLxoQz2AUAP8P7fV/mFZ0qo3JqV1UC8GtwKnPVYbWkF4kDgo0a5LNLKc9OUfN/3Fj2zT/yFbTrS+VNRyz0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=a4o9JB5t; arc=none smtp.client-ip=192.198.163.7
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="a4o9JB5t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1748306522; x=1779842522;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=koTTMpCnx2yU+RxxlY9kENsOZAnnE0YvRuXb43qdjv8=;
  b=a4o9JB5tluXVPbVPxS0uh7MBmbkd1NpBuKV5+sKJIqZSv+QAmrsC7Px3
   gfYBiRiuC4R130iE8q3iRSgbFYZRWjow9d3fBLDaoHG3CK2qzzoC9vNfz
   1rYusiRDCfM3WFBym4biXF6wRhL+pLqC6LsAn04Fxzc4qGbfd6xgLwPYI
   NrsvpO9d2D96nKpFGpJWP50jBpGn1yZkx9s3+VmQfFcwt6vwSVHNZj8w5
   YtgpCxpiie6uRhSzCaUVW4P2tSiwq8/lk2wwrARnIa2TLyvWvYV6SUFW9
   eswjd5Dw8jztRXwnnB9t7ZJ2RmV3UG9EUWHyAE8Ab9hOOAxeAAvT87hI1
   A==;
X-CSE-ConnectionGUID: xwY2Y4GxR2ybrYhYfDy3AA==
X-CSE-MsgGUID: CMP3xPaERC68+RLBX2jmSQ==
X-IronPort-AV: E=McAfee;i="6700,10204,11445"; a="75673356"
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="75673356"
Received: from fmviesa002.fm.intel.com ([10.60.135.142])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 26 May 2025 17:42:01 -0700
X-CSE-ConnectionGUID: UeiGnD57QhKOjNoWfAWjtg==
X-CSE-MsgGUID: mukzv6VNTg2azyYqBY9sFg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.15,317,1739865600"; 
   d="scan'208";a="165751814"
Received: from lkp-server01.sh.intel.com (HELO 1992f890471c) ([10.239.97.150])
  by fmviesa002.fm.intel.com with ESMTP; 26 May 2025 17:42:00 -0700
Received: from kbuild by 1992f890471c with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1uJiOE-000Slt-1U;
	Tue, 27 May 2025 00:41:58 +0000
Date: Tue, 27 May 2025 08:41:20 +0800
From: kernel test robot <lkp@intel.com>
To: Sven Peter <sven@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [sven:wip/smc-hid 21/22] drivers/input/misc/macsmc-hid.c:39:3:
 error: expected expression
Message-ID: <202505270847.kK2FpmSF-lkp@intel.com>
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
config: riscv-allyesconfig (https://download.01.org/0day-ci/archive/20250527/202505270847.kK2FpmSF-lkp@intel.com/config)
compiler: clang version 16.0.6 (https://github.com/llvm/llvm-project 7cbf1a2591520c2491aa35339f227775f4d3adf6)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250527/202505270847.kK2FpmSF-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202505270847.kK2FpmSF-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/input/misc/macsmc-hid.c:39:3: error: expected expression
                   u8 button = (event >> 8) & 0xff;
                   ^
>> drivers/input/misc/macsmc-hid.c:41:11: error: use of undeclared identifier 'button'
                   switch (button) {
                           ^
   drivers/input/misc/macsmc-hid.c:76:3: error: expected expression
                   u8 lid_state = !!((event >> 8) & 0xff);
                   ^
>> drivers/input/misc/macsmc-hid.c:77:31: error: use of undeclared identifier 'lid_state'; did you mean 'node_state'?
                   if (smchid->wakeup_mode && !lid_state) {
                                               ^~~~~~~~~
                                               node_state
   include/linux/nodemask.h:427:28: note: 'node_state' declared here
   static __always_inline int node_state(int node, enum node_states state)
                              ^
   drivers/input/misc/macsmc-hid.c:77:31: warning: address of function 'node_state' will always evaluate to 'true' [-Wpointer-bool-conversion]
                   if (smchid->wakeup_mode && !lid_state) {
                                              ~^~~~~~~~~
   drivers/input/misc/macsmc-hid.c:77:31: note: prefix with the address-of operator to silence this warning
                   if (smchid->wakeup_mode && !lid_state) {
                                               ^
                                               &
   drivers/input/misc/macsmc-hid.c:81:46: error: use of undeclared identifier 'lid_state'; did you mean 'node_state'?
                   input_report_switch(smchid->input, SW_LID, lid_state);
                                                              ^~~~~~~~~
                                                              node_state
   include/linux/nodemask.h:427:28: note: 'node_state' declared here
   static __always_inline int node_state(int node, enum node_states state)
                              ^
   1 warning and 5 errors generated.


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
  > 41			switch (button) {
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
  > 77			if (smchid->wakeup_mode && !lid_state) {
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
