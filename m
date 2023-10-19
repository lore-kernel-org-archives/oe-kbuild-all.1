Received: from mgamail.intel.com (mgamail.intel.com [192.55.52.136])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71A2230F82
	for <oe-kbuild-all@lists.linux.dev>; Thu, 19 Oct 2023 16:59:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="iW5fX3gu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1697734759; x=1729270759;
  h=date:from:cc:subject:message-id:mime-version;
  bh=YfR53issbyV7+RREygevTu+umt3HWZUPOHcuNhHRTpk=;
  b=iW5fX3gugAfYPzSGcyYGjunD78oa8EWfQq6t1idMAnM2Jk72wQvPZi0i
   tN4cAOW5/IvUgaNehnjpEaoM5Sp8Z9ANPzFyxDMfZENCJuqOpLStpnrn/
   LS3Q1b0lCuh8EINXMTd5NZxqpHfpHFzRqKfLJRcpjcS07BLSslrg75216
   jKAyo2PBdZKbZoGjBhkLE7WVpOiPNybzjehSiA7aEXbZ70YfZjNkMmQcJ
   bnctOH7AYpJJpth3twPpvsmfFd8OVf7iTxpkD2ybumeqSTttKkcomIXtF
   qNmwFQzhAFSpKe8NU3ZkZs39InRvQwxt2Q44921FDdl6zLUGsFhbDJdJy
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10868"; a="365657275"
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="365657275"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmsmga106.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Oct 2023 09:59:18 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.03,237,1694761200"; 
   d="scan'208";a="5050631"
Received: from lkp-server01.sh.intel.com (HELO 8917679a5d3e) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 19 Oct 2023 09:59:18 -0700
Received: from kbuild by 8917679a5d3e with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1qtWMc-0002HK-1J;
	Thu, 19 Oct 2023 16:59:14 +0000
Date: Fri, 20 Oct 2023 00:59:10 +0800
From: kernel test robot <lkp@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, vigneshr@ti.com, nm@ti.com,
	Jai Luthra <j-luthra@ti.com>
Subject: [ti:ti-rt-linux-6.1.y 45/107] drivers/media/i2c/ds90ub960.c:2522:28:
 warning: array subscript 60 is above array bounds of 'struct <anonymous>[4]'
Message-ID: <202310200027.9VhtwGpM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   git://git.ti.com/ti-linux-kernel/ti-linux-kernel.git ti-rt-linux-6.1.y
head:   4a3a5f9a7567d507b37b51980516ce26b34b353e
commit: cf0136753f9892c69092d959eb86c8e06e706138 [45/107] media: i2c: add DS90UB960 driver
config: x86_64-randconfig-003-20231019 (https://download.01.org/0day-ci/archive/20231020/202310200027.9VhtwGpM-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20231020/202310200027.9VhtwGpM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202310200027.9VhtwGpM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/media/i2c/ds90ub960.c: In function 'ub960_configure_ports_for_streaming':
>> drivers/media/i2c/ds90ub960.c:2522:28: warning: array subscript 60 is above array bounds of 'struct <anonymous>[4]' [-Warray-bounds]
    2522 |                 if (rx_data[nport].tx_port == 1)
         |                     ~~~~~~~^~~~~~~
   drivers/media/i2c/ds90ub960.c:2402:11: note: while referencing 'rx_data'
    2402 |         } rx_data[UB960_MAX_RX_NPORTS] = {};
         |           ^~~~~~~


vim +2522 drivers/media/i2c/ds90ub960.c

  2391	
  2392	static int ub960_configure_ports_for_streaming(struct ub960_data *priv,
  2393						       struct v4l2_subdev_state *state)
  2394	{
  2395		u8 fwd_ctl;
  2396		struct {
  2397			u32 num_streams;
  2398			u8 pixel_dt;
  2399			u8 meta_dt;
  2400			u32 meta_lines;
  2401			u32 tx_port;
  2402		} rx_data[UB960_MAX_RX_NPORTS] = {};
  2403		u8 vc_map[UB960_MAX_RX_NPORTS] = {};
  2404		struct v4l2_subdev_route *route;
  2405		unsigned int nport;
  2406		int ret;
  2407	
  2408		ret = ub960_validate_stream_vcs(priv);
  2409		if (ret)
  2410			return ret;
  2411	
  2412		ub960_get_vc_maps(priv, state, vc_map);
  2413	
  2414		for_each_active_route(&state->routing, route) {
  2415			struct ub960_rxport *rxport;
  2416			struct ub960_txport *txport;
  2417			struct v4l2_mbus_framefmt *fmt;
  2418			const struct ub960_format_info *ub960_fmt;
  2419			unsigned int nport;
  2420	
  2421			nport = ub960_pad_to_port(priv, route->sink_pad);
  2422	
  2423			rxport = priv->rxports[nport];
  2424			if (!rxport)
  2425				return -EINVAL;
  2426	
  2427			txport = priv->txports[ub960_pad_to_port(priv, route->source_pad)];
  2428			if (!txport)
  2429				return -EINVAL;
  2430	
  2431			rx_data[nport].tx_port = ub960_pad_to_port(priv, route->source_pad);
  2432	
  2433			rx_data[nport].num_streams++;
  2434	
  2435			/* For the rest, we are only interested in parallel busses */
  2436			if (rxport->rx_mode == RXPORT_MODE_CSI2_SYNC ||
  2437			    rxport->rx_mode == RXPORT_MODE_CSI2_ASYNC)
  2438				continue;
  2439	
  2440			if (rx_data[nport].num_streams > 2)
  2441				return -EPIPE;
  2442	
  2443			fmt = v4l2_subdev_state_get_stream_format(state,
  2444								  route->sink_pad,
  2445								  route->sink_stream);
  2446			if (!fmt)
  2447				return -EPIPE;
  2448	
  2449			ub960_fmt = ub960_find_format(fmt->code);
  2450			if (!ub960_fmt)
  2451				return -EPIPE;
  2452	
  2453			if (ub960_fmt->meta) {
  2454				if (fmt->height > 3) {
  2455					dev_err(&priv->client->dev,
  2456						"rx%u: unsupported metadata height %u\n",
  2457						nport, fmt->height);
  2458					return -EPIPE;
  2459				}
  2460	
  2461				rx_data[nport].meta_dt = ub960_fmt->datatype;
  2462				rx_data[nport].meta_lines = fmt->height;
  2463			} else {
  2464				rx_data[nport].pixel_dt = ub960_fmt->datatype;
  2465			}
  2466		}
  2467	
  2468		/* Configure RX ports */
  2469	
  2470		fwd_ctl = 0;
  2471	
  2472		for (nport = 0; nport < priv->hw_data->num_rxports; nport++) {
  2473			struct ub960_rxport *rxport = priv->rxports[nport];
  2474			u8 vc = vc_map[nport];
  2475	
  2476			if (rx_data[nport].num_streams == 0)
  2477				continue;
  2478	
  2479			switch (rxport->rx_mode) {
  2480			case RXPORT_MODE_RAW10:
  2481				ub960_rxport_write(priv, nport, UB960_RR_RAW10_ID,
  2482					rx_data[nport].pixel_dt | (vc << UB960_RR_RAW10_ID_VC_SHIFT));
  2483	
  2484				ub960_rxport_write(priv, rxport->nport,
  2485					UB960_RR_RAW_EMBED_DTYPE,
  2486					(rx_data[nport].meta_lines << UB960_RR_RAW_EMBED_DTYPE_LINES_SHIFT) |
  2487						rx_data[nport].meta_dt);
  2488	
  2489				break;
  2490	
  2491			case RXPORT_MODE_RAW12_HF:
  2492			case RXPORT_MODE_RAW12_LF:
  2493				/* Not implemented */
  2494				break;
  2495	
  2496			case RXPORT_MODE_CSI2_SYNC:
  2497			case RXPORT_MODE_CSI2_ASYNC:
  2498				if (!priv->hw_data->is_ub9702) {
  2499					/* Map all VCs from this port to the same VC */
  2500					ub960_rxport_write(priv, nport, UB960_RR_CSI_VC_MAP,
  2501							   (vc << UB960_RR_CSI_VC_MAP_SHIFT(3)) |
  2502							   (vc << UB960_RR_CSI_VC_MAP_SHIFT(2)) |
  2503							   (vc << UB960_RR_CSI_VC_MAP_SHIFT(1)) |
  2504							   (vc << UB960_RR_CSI_VC_MAP_SHIFT(0)));
  2505				} else {
  2506					unsigned int i;
  2507	
  2508					/* Map all VCs from this port to VC(nport) */
  2509					for (i = 0; i < 8; i++)
  2510						ub960_rxport_write(priv, nport,
  2511								   UB960_RR_VC_ID_MAP(i),
  2512								   nport);
  2513				}
  2514	
  2515				break;
  2516			}
  2517	
  2518			/* Forwarding */
  2519	
  2520			fwd_ctl |= BIT(4 + nport); /* forward disable */
  2521	
> 2522			if (rx_data[nport].tx_port == 1)
  2523				fwd_ctl |= BIT(nport); /* forward to TX1 */
  2524			else
  2525				fwd_ctl &= ~BIT(nport); /* forward to TX0 */
  2526		}
  2527	
  2528		ub960_write(priv, UB960_SR_FWD_CTL1, fwd_ctl);
  2529	
  2530		return 0;
  2531	}
  2532	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
