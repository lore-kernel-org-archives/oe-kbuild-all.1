Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.15])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 65B5821CC5B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 12 Dec 2025 02:44:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.15
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765507455; cv=none; b=nfCS5YjURGxVsYCuIPzwxFJKrFluxWBEp2ix7qNWCSbgC/oGRv5/m8d/MFjYu35f6Gq7vCkSDQYlOz6jKNi/WxiEEadlOEFoVAvBYkBnGHNj68l+rROyN8NfsNWG+WguLcZsZg4X3C5h7+oWtbYKMFmG9akYFpwNrG1ge9RE9m8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765507455; c=relaxed/simple;
	bh=EKuVt23czljrBM0KjgH7LIcIPkKTsVGNKj8dSJ8KyS8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=EcuwlhLxXrlIW+uLMOXmhObYEHep0k9NmHiOqkmMOx//AAWX41DyQuOBHcfs+Q9eXFAEWKIlATe0+VmdKWZfpGm9d+pWYWDJb3CP8JEIWmK6W1O5VSqijb8rbNikbx/Ln2svkqTlOSRkdD4edA9gb5zGmlU0hMlo+jdlSMI1WCU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=aOJgt6kt; arc=none smtp.client-ip=192.198.163.15
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aOJgt6kt"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765507454; x=1797043454;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=EKuVt23czljrBM0KjgH7LIcIPkKTsVGNKj8dSJ8KyS8=;
  b=aOJgt6ktWK8c8lMBTjwFy3gGJI2DF9KTVmXzha1HDms35BrJzKi/CbB4
   /za++Y0tsytHaukRwFLUtJF44raYerVBHjHO2V8tTjAkUQhVHFDt+zovR
   fJCEuoPNjcvuQ6oneRlGu8y4SNVHvG+IwNDsE+tIfBGecismk+rA1B7XI
   54jT8WMqvDnjNJt5RYHYOJs8tJmKQygG+GSEX1f/KcHcBWfyhC+52W8Tv
   /9fGdkIK1b+uIhgfioaMYYTMg6gqWl7oQTV/xBZdMpTuZ7VY1Rg6Kj4QT
   +E6sf23EHvkM/cNoRRVrbivm9PceCTVpf54V4+z27qQkNh4jBHA2n3aM9
   Q==;
X-CSE-ConnectionGUID: V53Q9QUhRiK7QKdjNTa5YQ==
X-CSE-MsgGUID: gu7AjXkRQrOLvwF8T8T/sA==
X-IronPort-AV: E=McAfee;i="6800,10657,11639"; a="67575310"
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="67575310"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa109.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 11 Dec 2025 18:44:14 -0800
X-CSE-ConnectionGUID: U7kyQEV8TKSWcwDgfvJotQ==
X-CSE-MsgGUID: +6NBji/kRRKetJMWj1Z2Vw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,141,1763452800"; 
   d="scan'208";a="201127503"
Received: from lkp-server01.sh.intel.com (HELO d335e3c6db51) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 11 Dec 2025 18:44:12 -0800
Received: from kbuild by d335e3c6db51 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vTt8c-000000005OL-0nEF;
	Fri, 12 Dec 2025 02:44:10 +0000
Date: Fri, 12 Dec 2025 10:44:08 +0800
From: kernel test robot <lkp@intel.com>
To: cros-kernel-buildreports@googlegroups.com
Cc: oe-kbuild-all@lists.linux.dev
Subject: [android-common:android16-6.12-desktop 0/5]
 drivers/usb/host/xhci-sideband.c:345: warning: Function parameter or struct
 member 'type' not described in 'xhci_sideband_register'
Message-ID: <202512121032.4K0MDtqq-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://android.googlesource.com/kernel/common android16-6.12-desktop
head:   aede8f2a23afdacd71bb57369610179a20e859a7
commit: 8b9c57ce39a5a88dbc923cebe1fdd234239a7f94 [0/5] FROMGIT: xhci: sideband: add initial api to register a secondary interrupter entity
config: i386-randconfig-004-20251212 (https://download.01.org/0day-ci/archive/20251212/202512121032.4K0MDtqq-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20251212/202512121032.4K0MDtqq-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202512121032.4K0MDtqq-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/usb/host/xhci-sideband.c:263: warning: Function parameter or struct member 'imod_interval' not described in 'xhci_sideband_create_interrupter'
>> drivers/usb/host/xhci-sideband.c:345: warning: Function parameter or struct member 'type' not described in 'xhci_sideband_register'


vim +345 drivers/usb/host/xhci-sideband.c

   333	
   334	/**
   335	 * xhci_sideband_register - register a sideband for a usb device
   336	 * @intf: usb interface associated with the sideband device
   337	 *
   338	 * Allows for clients to utilize XHCI interrupters and fetch transfer and event
   339	 * ring parameters for executing data transfers.
   340	 *
   341	 * Return: pointer to a new xhci_sideband instance if successful. NULL otherwise.
   342	 */
   343	struct xhci_sideband *
   344	xhci_sideband_register(struct usb_interface *intf, enum xhci_sideband_type type)
 > 345	{
   346		struct usb_device *udev = interface_to_usbdev(intf);
   347		struct usb_hcd *hcd = bus_to_hcd(udev->bus);
   348		struct xhci_hcd *xhci = hcd_to_xhci(hcd);
   349		struct xhci_virt_device *vdev;
   350		struct xhci_sideband *sb;
   351	
   352		/*
   353		 * Make sure the usb device is connected to a xhci controller.  Fail
   354		 * registration if the type is anything other than  XHCI_SIDEBAND_VENDOR,
   355		 * as this is the only type that is currently supported by xhci-sideband.
   356		 */
   357		if (!udev->slot_id || type != XHCI_SIDEBAND_VENDOR)
   358			return NULL;
   359	
   360		sb = kzalloc_node(sizeof(*sb), GFP_KERNEL, dev_to_node(hcd->self.sysdev));
   361		if (!sb)
   362			return NULL;
   363	
   364		mutex_init(&sb->mutex);
   365	
   366		/* check this device isn't already controlled via sideband */
   367		spin_lock_irq(&xhci->lock);
   368	
   369		vdev = xhci->devs[udev->slot_id];
   370	
   371		if (!vdev || vdev->sideband) {
   372			xhci_warn(xhci, "XHCI sideband for slot %d already in use\n",
   373				  udev->slot_id);
   374			spin_unlock_irq(&xhci->lock);
   375			kfree(sb);
   376			return NULL;
   377		}
   378	
   379		sb->xhci = xhci;
   380		sb->vdev = vdev;
   381		sb->intf = intf;
   382		sb->type = type;
   383		vdev->sideband = sb;
   384	
   385		spin_unlock_irq(&xhci->lock);
   386	
   387		return sb;
   388	}
   389	EXPORT_SYMBOL_GPL(xhci_sideband_register);
   390	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
