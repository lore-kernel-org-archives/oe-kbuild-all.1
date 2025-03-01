Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 58B0B28F5
	for <oe-kbuild-all@lists.linux.dev>; Sat,  1 Mar 2025 20:32:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1740861137; cv=none; b=s2FqtyHeusDOAg+WqPMOFDmiBNflTRTZW0tU4t1wN+fKDOQajh46E0rb7xMuUU2JL+TtFk6zIlVoKVCUh/HDVCbRm2EFsChaW197Igmswy4c6jPOuLqzLwB9rLy26jI/XSePm+ZI5crTWio7I2GNwo7CnSSNN8qZTYjkEGPdtow=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1740861137; c=relaxed/simple;
	bh=s36nyAVRzmNd5+SuQyNJrHgQpoe0mBNkDUTBudxSCPI=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=R0hw98EfTuXKhNjwBCrRzwHUGPikz4BBMVRbPMUbHtJN8kqzjj+xzU/jzPelteQgHCqZ7HvKBsPKI5b2zndx8nNwiGxDAyrs6/UQZXmTI5A6z+ySz40xMstmvDrMbxbaGMf21jKgrqsuBpMjhHxhjRDLeC34ckvc7MOjta/211E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=nDTx+nkS; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="nDTx+nkS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1740861135; x=1772397135;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=s36nyAVRzmNd5+SuQyNJrHgQpoe0mBNkDUTBudxSCPI=;
  b=nDTx+nkSg7GeucoR+UnUPdlagln8A87L3XOPF3D7WKuq78so6R+Nbdr1
   taDY2sLAV56a60qMZHbyLDS+9SI0C1EfocWFjnRToccPJNkm3VGw45gEr
   OX012ywX5wM71jvqjd3jSJRGgpatc7maSEPRn5MdvjWGCgoeo+UOyZh6b
   q2ub+O8T37D5J66JcWlpjsZT5IdkvallOY7CKxqpMgtc0da7A/378e/J0
   J2D7/msNTyY8rOW6ZL+pGiChMjDqLAWvtLpPbujaFT9n/uTX5m0q7bMk+
   3QVHAbhNprK0VoP3lEntkQpfId8bOndkKtiYIpVtnbexUJhWw8v7PJmHe
   Q==;
X-CSE-ConnectionGUID: wmO2OP5qQ5+yq/uAbpMOpA==
X-CSE-MsgGUID: c+8BEV2HQf6S1SIcPhg0Dg==
X-IronPort-AV: E=McAfee;i="6700,10204,11360"; a="41893202"
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="41893202"
Received: from fmviesa009.fm.intel.com ([10.60.135.149])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 01 Mar 2025 12:32:14 -0800
X-CSE-ConnectionGUID: /drEcBOaR86hCl8z8t6tVw==
X-CSE-MsgGUID: T2UIKMDlQgW+un05XOiNLA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.13,326,1732608000"; 
   d="scan'208";a="118319421"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by fmviesa009.fm.intel.com with ESMTP; 01 Mar 2025 12:32:14 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1toTVF-000Gfq-15;
	Sat, 01 Mar 2025 20:32:07 +0000
Date: Sun, 2 Mar 2025 04:31:44 +0800
From: kernel test robot <lkp@intel.com>
To: Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v4 2/2] libceph: convert timeouts to secs_to_jiffies()
Message-ID: <202503020400.jW2vL2a8-lkp@intel.com>
References: <20250301-converge-secs-to-jiffies-part-two-v4-2-c9226df9e4ed@linux.microsoft.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250301-converge-secs-to-jiffies-part-two-v4-2-c9226df9e4ed@linux.microsoft.com>

Hi Easwar,

kernel test robot noticed the following build errors:

[auto build test ERROR on 0226d0ce98a477937ed295fb7df4cc30b46fc304]

url:    https://github.com/intel-lab-lkp/linux/commits/Easwar-Hariharan/rbd-convert-timeouts-to-secs_to_jiffies/20250301-122529
base:   0226d0ce98a477937ed295fb7df4cc30b46fc304
patch link:    https://lore.kernel.org/r/20250301-converge-secs-to-jiffies-part-two-v4-2-c9226df9e4ed%40linux.microsoft.com
patch subject: [PATCH v4 2/2] libceph: convert timeouts to secs_to_jiffies()
config: arc-randconfig-001-20250302 (https://download.01.org/0day-ci/archive/20250302/202503020400.jW2vL2a8-lkp@intel.com/config)
compiler: arceb-elf-gcc (GCC) 13.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250302/202503020400.jW2vL2a8-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503020400.jW2vL2a8-lkp@intel.com/

All errors (new ones prefixed by >>):

   net/ceph/ceph_common.c: In function 'ceph_parse_param':
>> net/ceph/ceph_common.c:530:50: error: 'struct fs_parse_result' has no member named 'uint32'; did you mean 'uint_32'?
     530 |                 if (result.uint_32 < 1 || result.uint32 > INT_MAX / HZ)
         |                                                  ^~~~~~
         |                                                  uint_32
   net/ceph/ceph_common.c:536:50: error: 'struct fs_parse_result' has no member named 'uint32'; did you mean 'uint_32'?
     536 |                 if (result.uint_32 < 1 || result.uint32 > INT_MAX / HZ)
         |                                                  ^~~~~~
         |                                                  uint_32
   net/ceph/ceph_common.c:542:28: error: 'struct fs_parse_result' has no member named 'uint32'; did you mean 'uint_32'?
     542 |                 if (result.uint32 > INT_MAX / HZ)
         |                            ^~~~~~
         |                            uint_32
   net/ceph/ceph_common.c:548:28: error: 'struct fs_parse_result' has no member named 'uint32'; did you mean 'uint_32'?
     548 |                 if (result.uint32 > INT_MAX / HZ)
         |                            ^~~~~~
         |                            uint_32


vim +530 net/ceph/ceph_common.c

   417	
   418	int ceph_parse_param(struct fs_parameter *param, struct ceph_options *opt,
   419			     struct fc_log *l)
   420	{
   421		struct fs_parse_result result;
   422		int token, err;
   423		struct p_log log = {.prefix = "libceph", .log = l};
   424	
   425		token = __fs_parse(&log, ceph_parameters, param, &result);
   426		dout("%s fs_parse '%s' token %d\n", __func__, param->key, token);
   427		if (token < 0)
   428			return token;
   429	
   430		switch (token) {
   431		case Opt_ip:
   432			err = ceph_parse_ips(param->string,
   433					     param->string + param->size,
   434					     &opt->my_addr, 1, NULL, ',');
   435			if (err) {
   436				error_plog(&log, "Failed to parse ip: %d", err);
   437				return err;
   438			}
   439			opt->flags |= CEPH_OPT_MYIP;
   440			break;
   441	
   442		case Opt_fsid:
   443			err = ceph_parse_fsid(param->string, &opt->fsid);
   444			if (err) {
   445				error_plog(&log, "Failed to parse fsid: %d", err);
   446				return err;
   447			}
   448			opt->flags |= CEPH_OPT_FSID;
   449			break;
   450		case Opt_name:
   451			kfree(opt->name);
   452			opt->name = param->string;
   453			param->string = NULL;
   454			break;
   455		case Opt_secret:
   456			ceph_crypto_key_destroy(opt->key);
   457			kfree(opt->key);
   458	
   459			opt->key = kzalloc(sizeof(*opt->key), GFP_KERNEL);
   460			if (!opt->key)
   461				return -ENOMEM;
   462			err = ceph_crypto_key_unarmor(opt->key, param->string);
   463			if (err) {
   464				error_plog(&log, "Failed to parse secret: %d", err);
   465				return err;
   466			}
   467			break;
   468		case Opt_key:
   469			ceph_crypto_key_destroy(opt->key);
   470			kfree(opt->key);
   471	
   472			opt->key = kzalloc(sizeof(*opt->key), GFP_KERNEL);
   473			if (!opt->key)
   474				return -ENOMEM;
   475			return get_secret(opt->key, param->string, &log);
   476		case Opt_crush_location:
   477			ceph_clear_crush_locs(&opt->crush_locs);
   478			err = ceph_parse_crush_location(param->string,
   479							&opt->crush_locs);
   480			if (err) {
   481				error_plog(&log, "Failed to parse CRUSH location: %d",
   482					   err);
   483				return err;
   484			}
   485			break;
   486		case Opt_read_from_replica:
   487			switch (result.uint_32) {
   488			case Opt_read_from_replica_no:
   489				opt->read_from_replica = 0;
   490				break;
   491			case Opt_read_from_replica_balance:
   492				opt->read_from_replica = CEPH_OSD_FLAG_BALANCE_READS;
   493				break;
   494			case Opt_read_from_replica_localize:
   495				opt->read_from_replica = CEPH_OSD_FLAG_LOCALIZE_READS;
   496				break;
   497			default:
   498				BUG();
   499			}
   500			break;
   501		case Opt_ms_mode:
   502			switch (result.uint_32) {
   503			case Opt_ms_mode_legacy:
   504				opt->con_modes[0] = CEPH_CON_MODE_UNKNOWN;
   505				opt->con_modes[1] = CEPH_CON_MODE_UNKNOWN;
   506				break;
   507			case Opt_ms_mode_crc:
   508				opt->con_modes[0] = CEPH_CON_MODE_CRC;
   509				opt->con_modes[1] = CEPH_CON_MODE_UNKNOWN;
   510				break;
   511			case Opt_ms_mode_secure:
   512				opt->con_modes[0] = CEPH_CON_MODE_SECURE;
   513				opt->con_modes[1] = CEPH_CON_MODE_UNKNOWN;
   514				break;
   515			case Opt_ms_mode_prefer_crc:
   516				opt->con_modes[0] = CEPH_CON_MODE_CRC;
   517				opt->con_modes[1] = CEPH_CON_MODE_SECURE;
   518				break;
   519			case Opt_ms_mode_prefer_secure:
   520				opt->con_modes[0] = CEPH_CON_MODE_SECURE;
   521				opt->con_modes[1] = CEPH_CON_MODE_CRC;
   522				break;
   523			default:
   524				BUG();
   525			}
   526			break;
   527	
   528		case Opt_osdkeepalivetimeout:
   529			/* 0 isn't well defined right now, reject it */
 > 530			if (result.uint_32 < 1 || result.uint32 > INT_MAX / HZ)
   531				goto out_of_range;
   532			opt->osd_keepalive_timeout = secs_to_jiffies(result.uint_32);
   533			break;
   534		case Opt_osd_idle_ttl:
   535			/* 0 isn't well defined right now, reject it */
   536			if (result.uint_32 < 1 || result.uint32 > INT_MAX / HZ)
   537				goto out_of_range;
   538			opt->osd_idle_ttl = secs_to_jiffies(result.uint_32);
   539			break;
   540		case Opt_mount_timeout:
   541			/* 0 is "wait forever" (i.e. infinite timeout) */
   542			if (result.uint32 > INT_MAX / HZ)
   543				goto out_of_range;
   544			opt->mount_timeout = secs_to_jiffies(result.uint_32);
   545			break;
   546		case Opt_osd_request_timeout:
   547			/* 0 is "wait forever" (i.e. infinite timeout) */
   548			if (result.uint32 > INT_MAX / HZ)
   549				goto out_of_range;
   550			opt->osd_request_timeout = secs_to_jiffies(result.uint_32);
   551			break;
   552	
   553		case Opt_share:
   554			if (!result.negated)
   555				opt->flags &= ~CEPH_OPT_NOSHARE;
   556			else
   557				opt->flags |= CEPH_OPT_NOSHARE;
   558			break;
   559		case Opt_crc:
   560			if (!result.negated)
   561				opt->flags &= ~CEPH_OPT_NOCRC;
   562			else
   563				opt->flags |= CEPH_OPT_NOCRC;
   564			break;
   565		case Opt_cephx_require_signatures:
   566			if (!result.negated)
   567				warn_plog(&log, "Ignoring cephx_require_signatures");
   568			else
   569				warn_plog(&log, "Ignoring nocephx_require_signatures, use nocephx_sign_messages");
   570			break;
   571		case Opt_cephx_sign_messages:
   572			if (!result.negated)
   573				opt->flags &= ~CEPH_OPT_NOMSGSIGN;
   574			else
   575				opt->flags |= CEPH_OPT_NOMSGSIGN;
   576			break;
   577		case Opt_tcp_nodelay:
   578			if (!result.negated)
   579				opt->flags |= CEPH_OPT_TCP_NODELAY;
   580			else
   581				opt->flags &= ~CEPH_OPT_TCP_NODELAY;
   582			break;
   583	
   584		case Opt_abort_on_full:
   585			opt->flags |= CEPH_OPT_ABORT_ON_FULL;
   586			break;
   587		case Opt_rxbounce:
   588			opt->flags |= CEPH_OPT_RXBOUNCE;
   589			break;
   590	
   591		default:
   592			BUG();
   593		}
   594	
   595		return 0;
   596	
   597	out_of_range:
   598		return inval_plog(&log, "%s out of range", param->key);
   599	}
   600	EXPORT_SYMBOL(ceph_parse_param);
   601	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
