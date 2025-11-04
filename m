Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9A866337BA4
	for <oe-kbuild-all@lists.linux.dev>; Tue,  4 Nov 2025 17:15:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762276518; cv=none; b=BbxBoRcJsfxJ+ghsIhh/n7S1GVWpMHvqQHwlTpbtzy1R8EkUIi3NquyU3G3yqglmItSAw7Dt4tlJux/2u28yUUffZ07MXCl3IKGe09fnoZAr1hCYVqwVEQAygPXq3564uvARqFhp2cfQZWpSHYqt0YKke+GhkK5OiiV1Llk+PcM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762276518; c=relaxed/simple;
	bh=qEZNNxTOUWj+zcg0vnAc1UvcumL4jCGCHAXCvkrxe+Q=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=UUcP3BS6RD7I+cER3lcSHqMj1i2dg+O2F9TTY5AU2Z4OejGGXimWrIVX4zGeuBblrYADOBxPPdfiq+UoKGTFC64RpB/+Al7VnI7uIw/eh/ODjkCn+voU7GaFhcX8DCNVa3L7+pYxLPq5UkDwSyGTsREzKBib0V54vNaKXIyjVa4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=mR2Id4A3; arc=none smtp.client-ip=198.175.65.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="mR2Id4A3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1762276516; x=1793812516;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=qEZNNxTOUWj+zcg0vnAc1UvcumL4jCGCHAXCvkrxe+Q=;
  b=mR2Id4A3ASvHV1R88oqCL49oYGGsQuFIlPepw+Z7qx4kHUPrWBvFrSEs
   S9Iamydl2PiqzcwQqkCRHl9S6QWcPX3Tfo1aUsQq/0IvkmCfoQEKBT/ir
   9O2Bvk7INI/d1UISptGIV0PnXrpQU1MMGc3Lg7SORLfa4IokMF3aiqphO
   ghdRYEnb8cpqh+BcyCI6gdrkZN8hKalCGFrJNqyKyCKbsq+npjifD3kU6
   ncUbqfmtKRvgkgb0K29fEsOKY405XNpDN3KHmjM35Hq6z2SaxGs1S7J8q
   TMP9oyAYBsWARo7YwV4Xwph8PbtvsQLtO8EEMunHMQpZ7m8J1Pz21IMvx
   w==;
X-CSE-ConnectionGUID: CLW+WJ6jSMKi3wIggtWN5A==
X-CSE-MsgGUID: uPtyykRrSXKrEv/qV2mXog==
X-IronPort-AV: E=McAfee;i="6800,10657,11603"; a="64416774"
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="64416774"
Received: from orviesa009.jf.intel.com ([10.64.159.149])
  by orvoesa110.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Nov 2025 09:15:16 -0800
X-CSE-ConnectionGUID: vztGA+NbS9W0gxtZ66LEGA==
X-CSE-MsgGUID: CH5E/ovCS6KYtFe/WuZfFw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.19,279,1754982000"; 
   d="scan'208";a="186896085"
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by orviesa009.jf.intel.com with ESMTP; 04 Nov 2025 09:15:07 -0800
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vGKbe-000Rf2-1U;
	Tue, 04 Nov 2025 17:14:25 +0000
Date: Wed, 5 Nov 2025 01:13:36 +0800
From: kernel test robot <lkp@intel.com>
To: Daniel Zahka <daniel.zahka@gmail.com>, Jiri Pirko <jiri@resnulli.us>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Simon Horman <horms@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Srujana Challa <schalla@marvell.com>,
	Bharat Bhushan <bbhushan2@marvell.com>,
	Herbert Xu <herbert@gondor.apana.org.au>,
	Brett Creeley <brett.creeley@amd.com>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	Michael Chan <michael.chan@broadcom.com>,
	Pavan Chebbi <pavan.chebbi@broadcom.com>,
	Tony Nguyen <anthony.l.nguyen@intel.com>,
	Przemek Kitszel <przemyslaw.kitszel@intel.com>,
	Sunil Goutham <sgoutham@marvell.com>,
	Linu Cherian <lcherian@marvell.com>,
	Geetha sowjanya <gakula@marvell.com>,
	Jerin Jacob <jerinj@marvell.com>, hariprasad <hkelam@marvell.com>,
	Subbaraya Sundeep <sbhatta@marvell.com>,
	Tariq Toukan <tariqt@nvidia.com>,
	Saeed Mahameed <saeedm@nvidia.com>,
	Leon Romanovsky <leon@kernel.org>, Mark Bloch <mbloch@nvidia.com>,
	Ido Schimmel <idosch@nvidia.com>, Petr Machata <petrm@nvidia.com>,
	Manish Chopra <manishc@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, netdev@vger.kernel.org
Subject: Re: [PATCH net-next v2 1/2] devlink: pass extack through to
 devlink_param::get()
Message-ID: <202511050016.4uxLfNjG-lkp@intel.com>
References: <20251103194554.3203178-2-daniel.zahka@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251103194554.3203178-2-daniel.zahka@gmail.com>

Hi Daniel,

kernel test robot noticed the following build warnings:

[auto build test WARNING on net-next/main]

url:    https://github.com/intel-lab-lkp/linux/commits/Daniel-Zahka/devlink-pass-extack-through-to-devlink_param-get/20251104-034818
base:   net-next/main
patch link:    https://lore.kernel.org/r/20251103194554.3203178-2-daniel.zahka%40gmail.com
patch subject: [PATCH net-next v2 1/2] devlink: pass extack through to devlink_param::get()
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20251105/202511050016.4uxLfNjG-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251105/202511050016.4uxLfNjG-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202511050016.4uxLfNjG-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> Warning: drivers/net/ethernet/intel/ice/devlink/devlink.c:618 function parameter 'extack' not described in 'ice_devlink_tx_sched_layers_get'
>> Warning: drivers/net/ethernet/intel/ice/devlink/devlink.c:1533 function parameter 'extack' not described in 'ice_devlink_local_fwd_get'

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
