Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.19])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C0B5D1DFD1
	for <oe-kbuild-all@lists.linux.dev>; Sat,  9 Nov 2024 07:29:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.19
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1731137382; cv=none; b=jTHh+puCz5GWywSoqozzbpmRcpLs/Xzqf4feH96FGfPCxBIcZrdBYbym7g8RlpnTK55pl3HsU54CW2S4pFQ9s4Ho07umuUpnk1tTWl5LssWhFixaAsaqeopQ1+onfpqK+IIhq1TB+8yRFKMtuNHuOHRGIAwlw+/JJdopGlbrabg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1731137382; c=relaxed/simple;
	bh=wS21lqo5FEUuJwTr36W12M9yIxErSk0imc90M6ID4r4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=tlLDIbwREBiXFtna6JQyVc5Ka5C+MPqVUpkiVyT4JtV4beyXwVC8L3YbLhi5ABfJoYom1kmwNecYiw+iTI0k3p8er9NzUgGfFs1b56GwoLC9hp+PswWrNeUmIIQkT5OdPYp0RLa+NCJgC//Qhzc7iStJnVGVcOziisiX9OHpPNM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Yz/TsEHS; arc=none smtp.client-ip=192.198.163.19
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Yz/TsEHS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1731137379; x=1762673379;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=wS21lqo5FEUuJwTr36W12M9yIxErSk0imc90M6ID4r4=;
  b=Yz/TsEHSHiMSZu8aFx7krzCbwGOLAQhsAh2KEXKkYULqZcfcpifo2ks5
   lXMtjMubvnQbGYFKyKtb8rQ96mq9g0nKCyCf5/FuNv5If3Z4M8XfsEe/H
   fe9VH88DnWg2dDtH9kg/Lg3MfXak/YMZNI91cyor3Pt49oMwcx/Ncvs/O
   nt0p4TnwnLJyK2voljhowMUnMBsfgk1tiUZYmpMsP5XtIEvfZo6Ojtvi7
   ulDCWgfMnrVfdEAy8M1dN+mc9AGccVNZ2W8bAQDDVkOvtv+ZL9U61mgda
   2ujLEhaNAm02Nh0+iBJfLbtB/9F1+zLTetgrtv19ouK22/x7v12xKflWk
   w==;
X-CSE-ConnectionGUID: 2EapJskTQ4uhrYsd2nM40g==
X-CSE-MsgGUID: 7NOZnQx+Qbipgt3rv8JAvw==
X-IronPort-AV: E=McAfee;i="6700,10204,11250"; a="30418494"
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="30418494"
Received: from fmviesa008.fm.intel.com ([10.60.135.148])
  by fmvoesa113.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2024 23:29:39 -0800
X-CSE-ConnectionGUID: e5bMwfL2SuuWqSpjnBn9yQ==
X-CSE-MsgGUID: FtWQa/86R7ihAG69ibR1/Q==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,140,1728975600"; 
   d="scan'208";a="86058479"
Received: from lkp-server01.sh.intel.com (HELO a48cf1aa22e8) ([10.239.97.150])
  by fmviesa008.fm.intel.com with ESMTP; 08 Nov 2024 23:29:38 -0800
Received: from kbuild by a48cf1aa22e8 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1t9fua-000sCM-06;
	Sat, 09 Nov 2024 07:29:36 +0000
Date: Sat, 9 Nov 2024 15:29:04 +0800
From: kernel test robot <lkp@intel.com>
To: himanshu.madhani@oracle.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC v1 6/8] scsi: Add multipath suppport for device handler
Message-ID: <202411091556.VY6C3maf-lkp@intel.com>
References: <20241109044529.992935-7-himanshu.madhani@oracle.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241109044529.992935-7-himanshu.madhani@oracle.com>

Hi,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build errors:

[auto build test ERROR on 128faa1845a2d5b0178b986f3bd18fb38cc08cc2]

url:    https://github.com/intel-lab-lkp/linux/commits/himanshu-madhani-oracle-com/scsi-Add-multipath-device-support/20241109-124908
base:   128faa1845a2d5b0178b986f3bd18fb38cc08cc2
patch link:    https://lore.kernel.org/r/20241109044529.992935-7-himanshu.madhani%40oracle.com
patch subject: [RFC v1 6/8] scsi: Add multipath suppport for device handler
config: x86_64-rhel-8.3 (https://download.01.org/0day-ci/archive/20241109/202411091556.VY6C3maf-lkp@intel.com/config)
compiler: gcc-12 (Debian 12.2.0-14) 12.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241109/202411091556.VY6C3maf-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202411091556.VY6C3maf-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/scsi/device_handler/scsi_dh_alua.c: In function 'alua_alloc_pg':
>> drivers/scsi/device_handler/scsi_dh_alua.c:262:58: error: 'struct scsi_device' has no member named 'mpath_pg_data'
     262 |                 struct scsi_mpath_dh_data *dh_data = sdev->mpath_pg_data;
         |                                                          ^~
>> drivers/scsi/device_handler/scsi_dh_alua.c:273:27: error: 'struct Scsi_Host' has no member named 'mpath_alua_grpid'
     273 |                 sdev->host->mpath_alua_grpid = pg->group_id;
         |                           ^~


vim +262 drivers/scsi/device_handler/scsi_dh_alua.c

   207	
   208	/*
   209	 * alua_alloc_pg - Allocate a new port_group structure
   210	 * @sdev: scsi device
   211	 * @group_id: port group id
   212	 * @tpgs: target port group settings
   213	 *
   214	 * Allocate a new port_group structure for a given
   215	 * device.
   216	 */
   217	static struct alua_port_group *alua_alloc_pg(struct scsi_device *sdev,
   218						     int group_id, int tpgs)
   219	{
   220		struct alua_port_group *pg, *tmp_pg;
   221	
   222		pg = kzalloc(sizeof(struct alua_port_group), GFP_KERNEL);
   223		if (!pg)
   224			return ERR_PTR(-ENOMEM);
   225	
   226		pg->device_id_len = scsi_vpd_lun_id(sdev, pg->device_id_str,
   227						    sizeof(pg->device_id_str));
   228		if (pg->device_id_len <= 0) {
   229			/*
   230			 * TPGS supported but no device identification found.
   231			 * Generate private device identification.
   232			 */
   233			sdev_printk(KERN_INFO, sdev,
   234				    "%s: No device descriptors found\n",
   235				    ALUA_DH_NAME);
   236			pg->device_id_str[0] = '\0';
   237			pg->device_id_len = 0;
   238		}
   239		pg->group_id = group_id;
   240		pg->tpgs = tpgs;
   241		pg->state = SCSI_ACCESS_STATE_OPTIMAL;
   242		pg->valid_states = TPGS_SUPPORT_ALL;
   243		if (optimize_stpg)
   244			pg->flags |= ALUA_OPTIMIZE_STPG;
   245		kref_init(&pg->kref);
   246		INIT_DELAYED_WORK(&pg->rtpg_work, alua_rtpg_work);
   247		INIT_LIST_HEAD(&pg->rtpg_list);
   248		INIT_LIST_HEAD(&pg->node);
   249		INIT_LIST_HEAD(&pg->dh_list);
   250		spin_lock_init(&pg->lock);
   251	
   252		spin_lock(&port_group_lock);
   253		tmp_pg = alua_find_get_pg(pg->device_id_str, pg->device_id_len,
   254					  group_id);
   255		if (tmp_pg) {
   256			spin_unlock(&port_group_lock);
   257			kfree(pg);
   258			return tmp_pg;
   259		}
   260	
   261		if (scsi_mpath_enabled(sdev)) {
 > 262			struct scsi_mpath_dh_data *dh_data = sdev->mpath_pg_data;
   263	
   264			dh_data->group_id = pg->group_id;
   265			dh_data->tpgs = pg->tpgs;
   266			dh_data->state = pg->state;
   267			dh_data->valid_states = pg->valid_states;
   268			dh_data->prefrence = pg->pref;
   269			dh_data->is_active = 1;
   270			dh_data->device_id_str = kstrdup(pg->device_id_str, GFP_KERNEL);
   271			dh_data->device_id_len = pg->device_id_len;
   272	
 > 273			sdev->host->mpath_alua_grpid = pg->group_id;
   274		}
   275	
   276		list_add(&pg->node, &port_group_list);
   277		spin_unlock(&port_group_lock);
   278	
   279		return pg;
   280	}
   281	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
