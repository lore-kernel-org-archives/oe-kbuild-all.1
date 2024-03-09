Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5AD511D558
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Mar 2024 06:46:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709966780; cv=none; b=RFbXFSssdrAn97eTnMl35HdCGKRSVuadplZhFfyt/yYK+Y1hpGEJbcpimz0SbLX3fwQzaMOM3WN2WHV8rsEJ8V0EEhTafXcZ0DIYKQzRzWlhJfs+bvBCbT+b7QVx70q+koO3cf3iGbwPmJqIx+rkCxw+gKf34SFTzmbf/dChR9E=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709966780; c=relaxed/simple;
	bh=2WRR8wyBVoAz+2S5N9NvBEyA5fsuphLR07ubysDKVyk=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=JheCZWz9A4BNSqnzY6Mt57nz0E071yygFwzI5XnOJ2Lynj0RqjcVrFK+l6Wi4wHDjyTUaIc6v6zeymD1gootGksz3Aitfgtc6P8NuQUGkXUnCwS+E2z1cCLl4Bh+fX8hNgh1vgJUSr2e8LQbQTSGZO17xUta+2XQf9tjUv1VIiQ=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MwTI5q/Q; arc=none smtp.client-ip=198.175.65.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MwTI5q/Q"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1709966778; x=1741502778;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=2WRR8wyBVoAz+2S5N9NvBEyA5fsuphLR07ubysDKVyk=;
  b=MwTI5q/QQgu8gmj+W/PfoZVblFcgwVS+hM+6R/PjZhm3x967p4X44YSb
   0IXqschbhf3Hk0JDzf3NTnYFZJVCOS1hr+Rw6449Y/Ovp5wfqndel26mE
   eNXUQQWthnUwngUcjQsuuiOWa7pay3cJEdDCEFfwYreNGSwgjbr4LKYMC
   pFP6pHtFBPItnkNhjxiAns7cU5tCTeI2yJqwuYUlVG7Ekp5vWHP0o07Mt
   KzSf3F+N1qvf7NC3OBIBlx7F3aO5AXyN/IR7gr86u8OXkwO9YKejTqkrq
   MF8cTfXFswPUYGZ1uU0AJgKbF6g035/+tfz7NZUxNw+SiGGGZFQ8SBbYT
   A==;
X-IronPort-AV: E=McAfee;i="6600,9927,11007"; a="4556521"
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="4556521"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by orvoesa111.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Mar 2024 22:46:17 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.07,112,1708416000"; 
   d="scan'208";a="10554189"
Received: from lkp-server01.sh.intel.com (HELO b21307750695) ([10.239.97.150])
  by fmviesa009.fm.intel.com with ESMTP; 08 Mar 2024 22:46:15 -0800
Received: from kbuild by b21307750695 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1riqTE-000747-2n;
	Sat, 09 Mar 2024 06:46:12 +0000
Date: Sat, 9 Mar 2024 14:45:35 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com,
	Guenter Roeck <groeck@google.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [chrome-os:chromeos-5.15 7/8] drivers/bluetooth/btintel.c:2573:43:
 warning: this statement may fall through
Message-ID: <202403091444.bGKiADlO-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://chromium.googlesource.com/chromiumos/third_party/kernel chromeos-5.15
head:   5d9b7cc67747d2fb00336f82942c4085787d7624
commit: 14f3028da4a2f73ba4e49da897f70b923dca5090 [7/8] CHROMIUM:bluetooth: add quirk using packet size 24
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20240309/202403091444.bGKiADlO-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20240309/202403091444.bGKiADlO-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202403091444.bGKiADlO-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/bluetooth/btintel.c: In function 'btintel_setup_combined':
>> drivers/bluetooth/btintel.c:2573:43: warning: this statement may fall through [-Wimplicit-fallthrough=]
    2573 |                         hdev->wbs_pkt_len = 24;
         |                         ~~~~~~~~~~~~~~~~~~^~~~
   drivers/bluetooth/btintel.c:2574:17: note: here
    2574 |                 case 0x11:      /* JfP */
         |                 ^~~~


vim +2573 drivers/bluetooth/btintel.c

  2458	
  2459	static int btintel_setup_combined(struct hci_dev *hdev)
  2460	{
  2461		const u8 param[1] = { 0xFF };
  2462		struct intel_version ver;
  2463		struct intel_version_tlv ver_tlv;
  2464		struct sk_buff *skb;
  2465		int err;
  2466	
  2467		BT_DBG("%s", hdev->name);
  2468	
  2469		/* The some controllers have a bug with the first HCI command sent to it
  2470		 * returning number of completed commands as zero. This would stall the
  2471		 * command processing in the Bluetooth core.
  2472		 *
  2473		 * As a workaround, send HCI Reset command first which will reset the
  2474		 * number of completed commands and allow normal command processing
  2475		 * from now on.
  2476		 *
  2477		 * Regarding the INTEL_BROKEN_SHUTDOWN_LED flag, these devices maybe
  2478		 * in the SW_RFKILL ON state as a workaround of fixing LED issue during
  2479		 * the shutdown() procedure, and once the device is in SW_RFKILL ON
  2480		 * state, the only way to exit out of it is sending the HCI_Reset
  2481		 * command.
  2482		 */
  2483		if (btintel_test_flag(hdev, INTEL_BROKEN_INITIAL_NCMD) ||
  2484		    btintel_test_flag(hdev, INTEL_BROKEN_SHUTDOWN_LED)) {
  2485			skb = __hci_cmd_sync(hdev, HCI_OP_RESET, 0, NULL,
  2486					     HCI_INIT_TIMEOUT);
  2487			if (IS_ERR(skb)) {
  2488				bt_dev_err(hdev,
  2489					   "sending initial HCI reset failed (%ld)",
  2490					   PTR_ERR(skb));
  2491				return PTR_ERR(skb);
  2492			}
  2493			kfree_skb(skb);
  2494		}
  2495	
  2496		/* Starting from TyP device, the command parameter and response are
  2497		 * changed even though the OCF for HCI_Intel_Read_Version command
  2498		 * remains same. The legacy devices can handle even if the
  2499		 * command has a parameter and returns a correct version information.
  2500		 * So, it uses new format to support both legacy and new format.
  2501		 */
  2502		skb = __hci_cmd_sync(hdev, 0xfc05, 1, param, HCI_CMD_TIMEOUT);
  2503		if (IS_ERR(skb)) {
  2504			bt_dev_err(hdev, "Reading Intel version command failed (%ld)",
  2505				   PTR_ERR(skb));
  2506			return PTR_ERR(skb);
  2507		}
  2508	
  2509		/* Check the status */
  2510		if (skb->data[0]) {
  2511			bt_dev_err(hdev, "Intel Read Version command failed (%02x)",
  2512				   skb->data[0]);
  2513			err = -EIO;
  2514			goto exit_error;
  2515		}
  2516	
  2517		/* Apply the common HCI quirks for Intel device */
  2518		set_bit(HCI_QUIRK_STRICT_DUPLICATE_FILTER, &hdev->quirks);
  2519		set_bit(HCI_QUIRK_SIMULTANEOUS_DISCOVERY, &hdev->quirks);
  2520		set_bit(HCI_QUIRK_NON_PERSISTENT_DIAG, &hdev->quirks);
  2521	
  2522		/* Set up the quality report callbacks for Intel devices */
  2523		hdev->set_quality_report = btintel_set_quality_report;
  2524		hdev->is_quality_report_evt = btintel_is_quality_report_evt;
  2525		hdev->pull_quality_report_data = btintel_pull_quality_report_data;
  2526	
  2527		/* For Legacy device, check the HW platform value and size */
  2528		if (skb->len == sizeof(ver) && skb->data[1] == 0x37) {
  2529			bt_dev_dbg(hdev, "Read the legacy Intel version information");
  2530	
  2531			memcpy(&ver, skb->data, sizeof(ver));
  2532	
  2533			/* Display version information */
  2534			btintel_version_info(hdev, &ver);
  2535	
  2536			/* Check for supported iBT hardware variants of this firmware
  2537			 * loading method.
  2538			 *
  2539			 * This check has been put in place to ensure correct forward
  2540			 * compatibility options when newer hardware variants come
  2541			 * along.
  2542			 */
  2543			switch (ver.hw_variant) {
  2544			case 0x07:	/* WP */
  2545			case 0x08:	/* StP */
  2546				/* Legacy ROM product */
  2547				btintel_set_flag(hdev, INTEL_ROM_LEGACY);
  2548	
  2549				/* Apply the device specific HCI quirks
  2550				 *
  2551				 * WBS for SdP - For the Legacy ROM products, only SdP
  2552				 * supports the WBS. But the version information is not
  2553				 * enough to use here because the StP2 and SdP have same
  2554				 * hw_variant and fw_variant. So, this flag is set by
  2555				 * the transport driver (btusb) based on the HW info
  2556				 * (idProduct)
  2557				 */
  2558				if (!btintel_test_flag(hdev,
  2559						       INTEL_ROM_LEGACY_NO_WBS_SUPPORT))
  2560					set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED,
  2561						&hdev->quirks);
  2562				if (ver.hw_variant == 0x08 && ver.fw_variant == 0x22)
  2563					set_bit(HCI_QUIRK_VALID_LE_STATES,
  2564						&hdev->quirks);
  2565	
  2566				err = btintel_legacy_rom_setup(hdev, &ver);
  2567				break;
  2568			case 0x0b:      /* SfP */
  2569				/* Apply the device specific controller quirk
  2570				 *
  2571				 * Use packet size 24 for the chip
  2572				 */
> 2573				hdev->wbs_pkt_len = 24;
  2574			case 0x11:      /* JfP */
  2575			case 0x12:      /* ThP */
  2576			case 0x13:      /* HrP */
  2577			case 0x14:      /* CcP */
  2578			case 0x1c:      /* GaP */
  2579				set_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks);
  2580				fallthrough;
  2581			case 0x0c:	/* WsP */
  2582				/* Apply the device specific HCI quirks
  2583				 *
  2584				 * All Legacy bootloader devices support WBS
  2585				 */
  2586				set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED,
  2587					&hdev->quirks);
  2588	
  2589				/* Setup MSFT Extension support */
  2590				btintel_set_msft_opcode(hdev, ver.hw_variant);
  2591	
  2592				err = btintel_bootloader_setup(hdev, &ver);
  2593				btintel_register_devcoredump_support(hdev);
  2594				break;
  2595			default:
  2596				bt_dev_err(hdev, "Unsupported Intel hw variant (%u)",
  2597					   ver.hw_variant);
  2598				err = -EINVAL;
  2599			}
  2600	
  2601			goto exit_error;
  2602		}
  2603	
  2604		memset(&ver_tlv, 0, sizeof(ver_tlv));
  2605		/* For TLV type device, parse the tlv data */
  2606		err = btintel_parse_version_tlv(hdev, &ver_tlv, skb);
  2607		if (err) {
  2608			bt_dev_err(hdev, "Failed to parse TLV version information");
  2609			goto exit_error;
  2610		}
  2611	
  2612		if (INTEL_HW_PLATFORM(ver_tlv.cnvi_bt) != 0x37) {
  2613			bt_dev_err(hdev, "Unsupported Intel hardware platform (0x%2x)",
  2614				   INTEL_HW_PLATFORM(ver_tlv.cnvi_bt));
  2615			err = -EINVAL;
  2616			goto exit_error;
  2617		}
  2618	
  2619		/* Check for supported iBT hardware variants of this firmware
  2620		 * loading method.
  2621		 *
  2622		 * This check has been put in place to ensure correct forward
  2623		 * compatibility options when newer hardware variants come
  2624		 * along.
  2625		 */
  2626		switch (INTEL_HW_VARIANT(ver_tlv.cnvi_bt)) {
  2627		case 0x11:      /* JfP */
  2628		case 0x12:      /* ThP */
  2629		case 0x13:      /* HrP */
  2630		case 0x14:      /* CcP */
  2631			/* Some legacy bootloader devices starting from JfP,
  2632			 * the operational firmware supports both old and TLV based
  2633			 * HCI_Intel_Read_Version command based on the command
  2634			 * parameter.
  2635			 *
  2636			 * For upgrading firmware case, the TLV based version cannot
  2637			 * be used because the firmware filename for legacy bootloader
  2638			 * is based on the old format.
  2639			 *
  2640			 * Also, it is not easy to convert TLV based version from the
  2641			 * legacy version format.
  2642			 *
  2643			 * So, as a workaround for those devices, use the legacy
  2644			 * HCI_Intel_Read_Version to get the version information and
  2645			 * run the legacy bootloader setup.
  2646			 */
  2647			err = btintel_read_version(hdev, &ver);
  2648			if (err)
  2649				break;
  2650	
  2651			/* Apply the device specific HCI quirks
  2652			 *
  2653			 * All Legacy bootloader devices support WBS
  2654			 */
  2655			set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
  2656	
  2657			/* Set Valid LE States quirk */
  2658			set_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks);
  2659	
  2660			/* Setup MSFT Extension support */
  2661			btintel_set_msft_opcode(hdev, ver.hw_variant);
  2662	
  2663			err = btintel_bootloader_setup(hdev, &ver);
  2664			btintel_register_devcoredump_support(hdev);
  2665			break;
  2666		case 0x17:
  2667		case 0x18:
  2668		case 0x19:
  2669		case 0x1b:
  2670		case 0x1c:
  2671			/* Display version information of TLV type */
  2672			btintel_version_info_tlv(hdev, &ver_tlv);
  2673	
  2674			/* Apply the device specific HCI quirks for TLV based devices
  2675			 *
  2676			 * All TLV based devices support WBS
  2677			 */
  2678			set_bit(HCI_QUIRK_WIDEBAND_SPEECH_SUPPORTED, &hdev->quirks);
  2679	
  2680			/* Apply LE States quirk from solar onwards */
  2681			set_bit(HCI_QUIRK_VALID_LE_STATES, &hdev->quirks);
  2682	
  2683			/* Setup MSFT Extension support */
  2684			btintel_set_msft_opcode(hdev,
  2685						INTEL_HW_VARIANT(ver_tlv.cnvi_bt));
  2686	
  2687			err = btintel_bootloader_setup_tlv(hdev, &ver_tlv);
  2688			btintel_register_devcoredump_support(hdev);
  2689			break;
  2690		default:
  2691			bt_dev_err(hdev, "Unsupported Intel hw variant (%u)",
  2692				   INTEL_HW_VARIANT(ver_tlv.cnvi_bt));
  2693			err = -EINVAL;
  2694			break;
  2695		}
  2696	
  2697	exit_error:
  2698		kfree_skb(skb);
  2699	
  2700		return err;
  2701	}
  2702	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
