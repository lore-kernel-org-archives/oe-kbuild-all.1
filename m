Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4106252E062
	for <oe-kbuild-all@lists.linux.dev>; Wed,  9 Sep 2026 11:23:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788953023; cv=none; b=Q29faE3qnzEgMrtTs6wC91fgmu4ZJDcwO93c9s9YnFwYYifXvOHBkdqL/Oo1Tm5LuxzOXP6AtS5Bei7XDqo7k6hZocaujE3k9IRTPMnmci7TNPLvS94WkOlqczDc7cRQGZQY6CR0xR6VmVlSiny0NExI/DoyrFKBoDGtTOEd0J0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788953023; c=relaxed/simple;
	bh=v44QoMttzRXka58aVmbVoaQlYtvPLIzuGc7j/jOWohs=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type; b=ZYsysvQ+0M77NhsHrsPH/jZ9KQcqv05+fbFwpWAQHcf6wRpKrDPiSHHhzEWl+eP/kXKPspnhSomXhOQwwfevZlICkzPhwRBLrxanxARyAG8Hw5kp8rD4DaFcs5wFrG3EHIQYPeIrWijocGM3I3cW6YizfdX5wPBi0UA+h71rFHE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=XBDRHCL3; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="XBDRHCL3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1788953021; x=1820489021;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=v44QoMttzRXka58aVmbVoaQlYtvPLIzuGc7j/jOWohs=;
  b=XBDRHCL3Z1Xn5VEnLb/vxYbOlIZT/2bXJ8/l31SbisBKGM9dNITq90Wb
   OI+ni6Mj9IcjVhE9v5D1CdqRC52yPqwhNDNo3L+UHtkBT93FsfhLQdwWx
   ggKaUiBZ5iff3Lgbw8Fy6ujhcr8NXDl4CYBMvxgvU/JMDjLau1rAzQCLc
   7ZuSLORBZNn0eVcPvnBAGjVwZfFIJTp9PigVqW2L6w6xq3gGt4XkRDq74
   Hdo4PR9yDteU6UDxY5UXCmdTayMrNtuuPiAoSrKktVCkQ1TWKf9TUMpZ2
   4qfsH41le6D43gbPcVLdlhR5Kd/eJ9wPwsGQ7aRRiJ63HwIAHMnDGCWtW
   g==;
X-CSE-ConnectionGUID: AOrpkmqtRiyk8BrOg8msIw==
X-CSE-MsgGUID: cJHetOx+TKizxhzqg3is0Q==
X-IronPort-AV: E=McAfee;i="6800,10657,11900"; a="100895085"
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="100895085"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 09 Sep 2026 04:23:40 -0700
X-CSE-ConnectionGUID: sM5A5T5eR8iJKby8Oyp61Q==
X-CSE-MsgGUID: lkrKGNPETTKbl9mIL59whQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,270,1779174000"; 
   d="scan'208";a="267614883"
Received: from igk-lkp-server01.igk.intel.com (HELO cc074f2a4298) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 09 Sep 2026 04:23:39 -0700
Received: from kbuild by cc074f2a4298 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1x4GOv-000000006bK-1Ey0;
	Wed, 09 Sep 2026 11:23:37 +0000
Date: Wed, 09 Sep 2026 13:22:49 +0200
From: kernel test robot <lkp@intel.com>
To: "Stefan =?utf-8?Q?D=C3=B6singer"?= <stefandoesinger@gmail.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [stefandoesinger-zx297520:dlink 132/132]
 drivers/misc/cardreader/infineon_usim.c:190:21: warning: unused variable 'i'
Message-ID: <202609091356.2pWHOzol-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii

tree:   https://gitlab.com/stefandoesinger/zx297520-kernel dlink
head:   ac919b52585145716ddb9d8154ca104ff2ea271b
commit: ac919b52585145716ddb9d8154ca104ff2ea271b [132/132] Sloppy APDU
config: sh-allmodconfig (https://download.01.org/0day-ci/archive/20260909/202609091356.2pWHOzol-lkp@intel.com/config)
compiler: sh4-linux-gcc (GCC) 16.1.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260909/202609091356.2pWHOzol-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202609091356.2pWHOzol-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/misc/cardreader/infineon_usim.c: In function 'usim_read_atr':
>> drivers/misc/cardreader/infineon_usim.c:190:21: warning: unused variable 'i' [-Wunused-variable]
     190 |         size_t len, i;
         |                     ^


vim +/i +190 drivers/misc/cardreader/infineon_usim.c

   184	
   185	static int usim_read_atr(struct usim_drv *usim, u8 *atr, u32 *atr_length, u32 *flags_inout)
   186	{
   187		u32 control, flags = *flags_inout;
   188		const char *convention = "error";
   189		int ret = 0;
 > 190		size_t len, i;
   191		u8 value;
   192	
   193		/* Read the ATR solely based on timeout. Don't try to be smart and parse incoming values to
   194		 * deduce a length. It is complicated logic and userspace validated the ATR anyway.
   195		 */
   196		flags &= (INFINEON_USIM_DIRECT_CONVENTION | INFINEON_USIM_INVERSE_CONVENTION);
   197	
   198		for (len = 0; len < INFINEON_USIM_ATR_MAX; ++len) {
   199			ret = usim_receive_char(usim, &value, USIM_ATR_TIMEOUT_MS);
   200	
   201			if (ret == -ETIMEDOUT)
   202				break;
   203	
   204			atr[len] = value;
   205			if (len)
   206				continue;
   207	
   208			/* Direct / Indirect convention handling: If specified by the client, apply it after
   209			 * reading the first byte.
   210			 *
   211			 * If left automatic, try to detect it based on the first byte: If it read without
   212			 * a parity error, assume direct. Otherwise, check for 0x03 ox 0x3f, fix it u and
   213			 * ignore the parity error.
   214			 */
   215			if (flags & INFINEON_USIM_DIRECT_CONVENTION) {
   216				/* do nothing */
   217				convention = "direct (requested)";
   218			} else if (!ret) {
   219				convention = "direct (detected)";
   220				flags |= INFINEON_USIM_DIRECT_CONVENTION;
   221			} else if (ret == -EBADMSG && (value == 0x03 || value == 0x3f)) {
   222				ret = 0;
   223				value = 0x3f;
   224	
   225				if (!flags) {
   226					convention = "inverse (detected)";
   227					flags |= INFINEON_USIM_INVERSE_CONVENTION;
   228				} else {
   229					convention = "inverse (requested)";
   230				}
   231	
   232				control = usim_readl(usim, USIM_REG_CONTROL);
   233				control |= USIM_CONTROL_INVERSE_CONVENTION;
   234				usim_writel(usim, control, USIM_REG_CONTROL);
   235			}
   236		}
   237		dev_dbg(usim->dev, "received ATR with %zu bytes, convention %s\n", len, convention);
   238	
   239		if (len == INFINEON_USIM_ATR_MAX)
   240			return -EOVERFLOW;
   241	
   242		*atr_length = len;
   243		*flags_inout |= flags;
   244	
   245		return 0;
   246	}
   247	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
