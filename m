Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.9])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C75932264CA
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 04:32:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.9
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768537960; cv=none; b=C+SzUuOnesmU25VtEbpD4bqjbusNa8mHha6yjNuVf63xDqsp4MdkPlvPCPldpWD4+Gqh/C6DavBA7NCPNqPor/uFU9iO5ho1YAovkrlsYRhw6JL0YpdNcDB8Cdv9cBjf1BFvaReh2sXZBgB0aiziJNk2W7nmNQzPXsYAPFH5o/4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768537960; c=relaxed/simple;
	bh=Tte1YIRTgKmpuiaC9E532qoSGT6x5v3vQec6dtSMw+U=;
	h=Date:From:To:Cc:Subject:Message-ID; b=Irhm2RnuT6uq6Xb4vDZ2fvCcO4cr2BQ6EyfaM38vJii99wO61MQB7N4+ugSRGjT663q/P+pu7nYRXf9acd6EzBNiStv8ZjnyWujTF+Qph4Z1N5L8QPRtBAUxnJR7Pkd8xW/WEzjXnXtP2xgt4v8WCow0yHitDgaCPv7zwetJgVA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=K9srch06; arc=none smtp.client-ip=198.175.65.9
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="K9srch06"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768537959; x=1800073959;
  h=date:from:to:cc:subject:message-id;
  bh=Tte1YIRTgKmpuiaC9E532qoSGT6x5v3vQec6dtSMw+U=;
  b=K9srch06SDZFDGli+MYXKda0GimWEn1AVzaKPzdMAVeORC334QpFvH++
   fbc0EEWsdyXNrQYOfxhp1zaZ83sIm1n/T14KlmMXxrCSPPut/u7ATIaqc
   tYW0WREy7beUygHWr23S59l8CPDoaEesg80qlG311/Ju7wg/DHFtax7fq
   dAUFpd+L3dokGvEP3XEIVHu7TVGKIv7Z+iLraGqNZ6rLrnEKUiD9pY2IL
   AucKil9Lm4Hbr2Gnn7iaP14E37KVjukX/kDEqNwc24yt/2gbIuvMyrxcu
   aYGj9fcCjfMhTUGXajCHD+Gmsu2Mefcy2gQdYXJHvAhiiGU7lB3M8ry3H
   A==;
X-CSE-ConnectionGUID: btVFSr/9QNydlOtGKHK2Qg==
X-CSE-MsgGUID: PQrudPcQR9CXPz54lb5DsA==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="92519921"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="92519921"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa101.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 20:32:39 -0800
X-CSE-ConnectionGUID: uN5gdqi3QUu1LXSDB+VqGA==
X-CSE-MsgGUID: ei5ov/61RvypbffiOR/Ekw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="235833907"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa002.jf.intel.com with ESMTP; 15 Jan 2026 20:32:38 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgbVi-00000000KNG-2vAy;
	Fri, 16 Jan 2026 04:32:34 +0000
Date: Fri, 16 Jan 2026 12:31:38 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/gicv5-host-acpi 7/7]
 drivers/acpi/arm64/iort.c:268:27: error: 'ACPI_IORT_NODE_IWB' undeclared; did
 you mean 'ACPI_IORT_NODE_RMR'?
Message-ID: <202601161221.M9P0ZuGL-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/gicv5-host-acpi
head:   8b07899770499d7cb5236cda6c96c702d2ad3d92
commit: 8b07899770499d7cb5236cda6c96c702d2ad3d92 [7/7] irqchip/gic-v5: Add ACPI IWB probing
config: arm64-defconfig (https://download.01.org/0day-ci/archive/20260116/202601161221.M9P0ZuGL-lkp@intel.com/config)
compiler: aarch64-linux-gcc (GCC) 15.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161221.M9P0ZuGL-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161221.M9P0ZuGL-lkp@intel.com/

All errors (new ones prefixed by >>):

   drivers/acpi/arm64/iort.c: In function 'iort_match_node_callback':
>> drivers/acpi/arm64/iort.c:268:27: error: 'ACPI_IORT_NODE_IWB' undeclared (first use in this function); did you mean 'ACPI_IORT_NODE_RMR'?
     268 |             node->type == ACPI_IORT_NODE_IWB) {
         |                           ^~~~~~~~~~~~~~~~~~
         |                           ACPI_IORT_NODE_RMR
   drivers/acpi/arm64/iort.c:268:27: note: each undeclared identifier is reported only once for each function it appears in
>> drivers/acpi/arm64/iort.c:305:42: error: invalid use of undefined type 'struct acpi_iort_iwb'
     305 |                         device_name = iwb->device_name;
         |                                          ^~
   drivers/acpi/arm64/iort.c: In function 'iort_match_iwb_callback':
   drivers/acpi/arm64/iort.c:333:27: error: 'ACPI_IORT_NODE_IWB' undeclared (first use in this function); did you mean 'ACPI_IORT_NODE_RMR'?
     333 |         if (node->type != ACPI_IORT_NODE_IWB)
         |                           ^~~~~~~~~~~~~~~~~~
         |                           ACPI_IORT_NODE_RMR
   drivers/acpi/arm64/iort.c:337:16: error: invalid use of undefined type 'struct acpi_iort_iwb'
     337 |         if (iwb->iwb_index != *id)
         |                ^~
   drivers/acpi/arm64/iort.c: In function 'iort_id_map':
   drivers/acpi/arm64/iort.c:349:29: error: 'ACPI_IORT_NODE_IWB' undeclared (first use in this function); did you mean 'ACPI_IORT_NODE_RMR'?
     349 |                     type == ACPI_IORT_NODE_IWB             ||
         |                             ^~~~~~~~~~~~~~~~~~
         |                             ACPI_IORT_NODE_RMR
   drivers/acpi/arm64/iort.c: In function 'iort_node_get_id':
   drivers/acpi/arm64/iort.c:419:35: error: 'ACPI_IORT_NODE_IWB' undeclared (first use in this function); did you mean 'ACPI_IORT_NODE_RMR'?
     419 |                     node->type == ACPI_IORT_NODE_IWB ||
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   ACPI_IORT_NODE_RMR
   drivers/acpi/arm64/iort.c: In function 'iort_find_dev_node':
   drivers/acpi/arm64/iort.c:597:39: error: 'ACPI_IORT_NODE_IWB' undeclared (first use in this function); did you mean 'ACPI_IORT_NODE_RMR'?
     597 |                 return iort_scan_node(ACPI_IORT_NODE_IWB,
         |                                       ^~~~~~~~~~~~~~~~~~
         |                                       ACPI_IORT_NODE_RMR
   drivers/acpi/arm64/iort.c: In function 'iort_iwb_handle':
   drivers/acpi/arm64/iort.c:802:31: error: 'ACPI_IORT_NODE_IWB' undeclared (first use in this function); did you mean 'ACPI_IORT_NODE_RMR'?
     802 |         node = iort_scan_node(ACPI_IORT_NODE_IWB, iort_match_iwb_callback, &iwb_id);
         |                               ^~~~~~~~~~~~~~~~~~
         |                               ACPI_IORT_NODE_RMR
   drivers/acpi/arm64/iort.c:807:43: error: invalid use of undefined type 'struct acpi_iort_iwb'
     807 |         status = acpi_get_handle(NULL, iwb->device_name, &handle);
         |                                           ^~
   drivers/acpi/arm64/iort.c: In function 'iort_get_platform_device_domain':
   drivers/acpi/arm64/iort.c:883:39: error: 'ACPI_IORT_NODE_IWB' undeclared (first use in this function); did you mean 'ACPI_IORT_NODE_RMR'?
     883 |                 node = iort_scan_node(ACPI_IORT_NODE_IWB,
         |                                       ^~~~~~~~~~~~~~~~~~
         |                                       ACPI_IORT_NODE_RMR


vim +268 drivers/acpi/arm64/iort.c

   260	
   261	static acpi_status iort_match_node_callback(struct acpi_iort_node *node,
   262						    void *context)
   263	{
   264		struct device *dev = context;
   265		acpi_status status = AE_NOT_FOUND;
   266	
   267		if (node->type == ACPI_IORT_NODE_NAMED_COMPONENT ||
 > 268		    node->type == ACPI_IORT_NODE_IWB) {
   269			struct acpi_buffer buf = { ACPI_ALLOCATE_BUFFER, NULL };
   270			struct acpi_iort_named_component *ncomp;
   271			struct acpi_iort_iwb *iwb;
   272			struct device *cdev = dev;
   273			struct acpi_device *adev;
   274			const char *device_name;
   275	
   276			/*
   277			 * Walk the device tree to find a device with an
   278			 * ACPI companion; there is no point in scanning
   279			 * IORT for a device matching a named component or IWB if
   280			 * the device does not have an ACPI companion to
   281			 * start with.
   282			 */
   283			do {
   284				adev = ACPI_COMPANION(cdev);
   285				if (adev)
   286					break;
   287	
   288				cdev = cdev->parent;
   289			} while (cdev);
   290	
   291			if (!adev)
   292				goto out;
   293	
   294			status = acpi_get_name(adev->handle, ACPI_FULL_PATHNAME, &buf);
   295			if (ACPI_FAILURE(status)) {
   296				dev_warn(cdev, "Can't get device full path name\n");
   297				goto out;
   298			}
   299	
   300			if (node->type == ACPI_IORT_NODE_NAMED_COMPONENT) {
   301				ncomp = (struct acpi_iort_named_component *)node->node_data;
   302				device_name = ncomp->device_name;
   303			} else {
   304				iwb = (struct acpi_iort_iwb *)node->node_data;
 > 305				device_name = iwb->device_name;
   306			}
   307			status = !strcmp(device_name, buf.pointer) ?  AE_OK : AE_NOT_FOUND;
   308			acpi_os_free(buf.pointer);
   309		} else if (node->type == ACPI_IORT_NODE_PCI_ROOT_COMPLEX) {
   310			struct acpi_iort_root_complex *pci_rc;
   311			struct pci_bus *bus;
   312	
   313			bus = to_pci_bus(dev);
   314			pci_rc = (struct acpi_iort_root_complex *)node->node_data;
   315	
   316			/*
   317			 * It is assumed that PCI segment numbers maps one-to-one
   318			 * with root complexes. Each segment number can represent only
   319			 * one root complex.
   320			 */
   321			status = pci_rc->pci_segment_number == pci_domain_nr(bus) ?
   322								AE_OK : AE_NOT_FOUND;
   323		}
   324	out:
   325		return status;
   326	}
   327	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
