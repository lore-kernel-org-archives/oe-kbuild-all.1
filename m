Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.14])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C4924168BD
	for <oe-kbuild-all@lists.linux.dev>; Fri,  6 Feb 2026 21:26:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.14
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1770413182; cv=none; b=IvQAxvhQA/sXXr2uJPHM9HmIaToz9TP9QqDBRWgIY2cmIDJaRKtKANYYG1+0URVLzj0qJGvYPkTnPCMmsO4+1U8O8m+hDwNRq2/UF2wXO6Bh1s/X4mJU2DED+piw+7U8qZnwa3LFyOj+nUNPRX1IedG+fNhTbQdHrrNIBexAeoA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1770413182; c=relaxed/simple;
	bh=2T07od/0Y6hzmkDiX1RLD/SCXRXmrAUlAOAgu0nEST4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=JDJCADZf7rKcQiacjSm4ztILlIRqCjsAonQXe7MuiW79kIUZqokDVYh0wLzy90ME9WNgRywlvRVFjvuj1gX20ojciwbvNKq1ar3oRSYzvhIBFpUxAKDCYfdRBkr7snQjR3TpaipGoaB/HQmu1r8H0UucHycFlLEToat2qW2uGCE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=oDqs+SRu; arc=none smtp.client-ip=192.198.163.14
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="oDqs+SRu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1770413182; x=1801949182;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=2T07od/0Y6hzmkDiX1RLD/SCXRXmrAUlAOAgu0nEST4=;
  b=oDqs+SRu8eanLvAcXJ+aFm9GjTHbKI/gFoHqWetfBzEejDgPiqpmEpBB
   GfswT9ygGsL+gq4IDMinrjlqmmRfU01PYzZ14j2TJErUlbMMsZ96BC/Zr
   73youLmplD1fekhE3+DBqU69YOcv5WyT1FHlhnTrKHTbhXaxzA+FS0km5
   vJa4dSsWSoGO7nKYrv/zNb9/h1vktBc0OOiG8RyCG8CqkS6eNRosBFnVz
   KbiPDrBn1fCBv47tPtZvxbLbXcOmtYz7L2t7rp7Dsr1vsHksXPtYSsd9u
   Ip8L1uAPddmqu8JwhF/N1uMZmAGwyqX9bcM8EVgb7Ax6/m5MR+WTaw8NX
   w==;
X-CSE-ConnectionGUID: 9vvtMgOORnqVbBhDewnshA==
X-CSE-MsgGUID: 8E2Tma+6QZybOQUqzD43rA==
X-IronPort-AV: E=McAfee;i="6800,10657,11693"; a="71690741"
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="71690741"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by fmvoesa108.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 06 Feb 2026 13:26:21 -0800
X-CSE-ConnectionGUID: IvDzmKR4Rx2FZA72u2qnFA==
X-CSE-MsgGUID: q0BiZXafSBiwMCI4inN3xw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,277,1763452800"; 
   d="scan'208";a="215470966"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 06 Feb 2026 13:26:18 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1voTLE-00000000lAi-03Ux;
	Fri, 06 Feb 2026 21:26:16 +0000
Date: Sat, 7 Feb 2026 05:25:36 +0800
From: kernel test robot <lkp@intel.com>
To: Aman Kumar Pandey <aman.kumarpandey@nxp.com>,
	linux-kernel@vger.kernel.org, linux-i3c@lists.infradead.org,
	alexandre.belloni@bootlin.com, krzk+dt@kernel.org, robh@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org, broonie@kernel.org,
	lee@kernel.org, Frank.Li@nxp.com, lgirdwood@gmail.com
Cc: oe-kbuild-all@lists.linux.dev, vikash.bansal@nxp.com,
	priyanka.jain@nxp.com, shashank.rebbapragada@nxp.com,
	Aman Kumar Pandey <aman.kumarpandey@nxp.com>
Subject: Re: [PATCH v5 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x
 I3C hub functionality
Message-ID: <202602070522.fcoiqtPw-lkp@intel.com>
References: <20260206120121.856471-5-aman.kumarpandey@nxp.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260206120121.856471-5-aman.kumarpandey@nxp.com>

Hi Aman,

kernel test robot noticed the following build warnings:

[auto build test WARNING on lee-mfd/for-mfd-next]
[also build test WARNING on lee-mfd/for-mfd-fixes broonie-regulator/for-next linus/master v6.19-rc8]
[cannot apply to i3c/i3c/next next-20260205]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Aman-Kumar-Pandey/dt-bindings-i3c-Add-NXP-P3H2x4x-i3c-hub-support/20260206-200552
base:   https://git.kernel.org/pub/scm/linux/kernel/git/lee/mfd.git for-mfd-next
patch link:    https://lore.kernel.org/r/20260206120121.856471-5-aman.kumarpandey%40nxp.com
patch subject: [PATCH v5 5/5] i3c: hub: p3h2x4x: Add support for NXP P3H2x4x I3C hub functionality
config: m68k-randconfig-r054-20260207 (https://download.01.org/0day-ci/archive/20260207/202602070522.fcoiqtPw-lkp@intel.com/config)
compiler: m68k-linux-gcc (GCC) 8.5.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260207/202602070522.fcoiqtPw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202602070522.fcoiqtPw-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/i3c/hub/p3h2840_i3c_hub_smbus.c: In function 'p3h2x4x_ibi_handler':
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:87:11: warning: unused variable 'i' [-Wunused-variable]
     u32 ret, i;
              ^
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:87:6: warning: unused variable 'ret' [-Wunused-variable]
     u32 ret, i;
         ^~~
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:86:44: warning: variable 'payload_byte_two' set but not used [-Wunused-but-set-variable]
     u32 target_port_status, payload_byte_one, payload_byte_two;
                                               ^~~~~~~~~~~~~~~~
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:86:6: warning: unused variable 'target_port_status' [-Wunused-variable]
     u32 target_port_status, payload_byte_one, payload_byte_two;
         ^~~~~~~~~~~~~~~~~~
>> drivers/i3c/hub/p3h2840_i3c_hub_smbus.c:85:30: warning: unused variable 'p3h2x4x_i3c_hub' [-Wunused-variable]
     struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(&i3cdev->dev);
                                 ^~~~~~~~~~~~~~~


vim +/i +87 drivers/i3c/hub/p3h2840_i3c_hub_smbus.c

    75	
    76	/**
    77	 * p3h2x4x_ibi_handler - IBI handler.
    78	 * @i3cdev: i3c device.
    79	 * @payload: two byte IBI payload data.
    80	 *
    81	 */
    82	void p3h2x4x_ibi_handler(struct i3c_device *i3cdev,
    83				 const struct i3c_ibi_payload *payload)
    84	{
  > 85		struct p3h2x4x_i3c_hub_dev *p3h2x4x_i3c_hub = dev_get_drvdata(&i3cdev->dev);
  > 86		u32 target_port_status, payload_byte_one, payload_byte_two;
  > 87		u32 ret, i;
    88	
    89		payload_byte_one = (*(int *)payload->data);
    90		payload_byte_two = (*(int *)(payload->data + 4));
    91	
    92		if (!(payload_byte_one & P3H2x4x_SMBUS_AGENT_EVENT_FLAG_STATUS))
    93			return;
    94	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
