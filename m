Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.13])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DB41E2F5A05
	for <oe-kbuild-all@lists.linux.dev>; Fri, 16 Jan 2026 06:40:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.13
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768545646; cv=none; b=ND6ACnW0EmtjALmyTzfa1TGCoAveMq+6lLCGRNFePz0u0l1UOD01865HjBx2GlmFDE50aAodlLaoQJsbkRkeN5IyNIs4DqfpIMyH04VO42doblyT3UP5XKy7n8qX0vh0Hyk3MFr4oZKMYqjmBCKuIrEloK+AUCVZRUM7y19C09M=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768545646; c=relaxed/simple;
	bh=Y4zp6V/9qmNG8V6+2VqOEypmLIJiJA1UF+aQXFGvBus=;
	h=Date:From:To:Cc:Subject:Message-ID; b=XKqonLTXWeHc0ko6aoOR0QEd/HxFbgTktXIwmBW15z//vfMYIQFj0tsLFcLwYAU0TBNJE4i85EriQEwtcvn6hvpBF1E7ziDRo26Rzr6RkAnGwYvzRekqSKzXCO/MWLlPESnWBezynPncGidMtIVNYndnKKW8bHT+XIzic/a58QY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MXsgNYaw; arc=none smtp.client-ip=198.175.65.13
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MXsgNYaw"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1768545645; x=1800081645;
  h=date:from:to:cc:subject:message-id;
  bh=Y4zp6V/9qmNG8V6+2VqOEypmLIJiJA1UF+aQXFGvBus=;
  b=MXsgNYawyrLP4iXM121O/Xv3EFNtqd1du/KqBRpH6ZF/q8E+hAkVHkq9
   AzVS4IqPDSU94gPxWPRTZhmXX8HuSaqmHOR9cXtxzKgsSTk3zYTdpNFXq
   wHEfs9PEwfDKfNPDu3cDmtNpU3yscWFCNwv+a2BJMDyjbzmShoJbLy2fZ
   TTc1Qw7eflPm4m8grop/06kooiaSZBwWn/XikHA1oDX1ndNDfCNjDGpgh
   gzH4ZiM1lZ7tVrTSEk2STRQ6ODDGjTZ3Dqv0LHJz7DhEht8g2NMoc85kA
   RJ+xZ/q3n9w0mD/3X55REEZXYnzODoKdyyFWHF4d1fKy3QQQXPS4lj/Gk
   A==;
X-CSE-ConnectionGUID: lbmmxqyxRieVeJz0vxoR4g==
X-CSE-MsgGUID: DkYoRmC2RjOiti3OZHzFDg==
X-IronPort-AV: E=McAfee;i="6800,10657,11672"; a="80972713"
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="80972713"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by orvoesa105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 15 Jan 2026 22:40:45 -0800
X-CSE-ConnectionGUID: S1xI3UX8Ro+c7tmh2MqeTA==
X-CSE-MsgGUID: 53K5RHnFQLGprGD74gAmvQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,230,1763452800"; 
   d="scan'208";a="209307722"
Received: from lkp-server01.sh.intel.com (HELO 765f4a05e27f) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 15 Jan 2026 22:40:43 -0800
Received: from kbuild by 765f4a05e27f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1vgdVg-00000000KUg-1IRs;
	Fri, 16 Jan 2026 06:40:40 +0000
Date: Fri, 16 Jan 2026 14:40:03 +0800
From: kernel test robot <lkp@intel.com>
To: Lorenzo Pieralisi <lpieralisi@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [lpieralisi:b4/gicv5-host-acpi 7/7]
 drivers/acpi/arm64/iort.c:268:20: error: use of undeclared identifier
 'ACPI_IORT_NODE_IWB'; did you mean 'ACPI_IORT_NODE_RMR'?
Message-ID: <202601161419.ILPZxcc9-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/lpieralisi/linux.git b4/gicv5-host-acpi
head:   8b07899770499d7cb5236cda6c96c702d2ad3d92
commit: 8b07899770499d7cb5236cda6c96c702d2ad3d92 [7/7] irqchip/gic-v5: Add ACPI IWB probing
config: arm64-allmodconfig (https://download.01.org/0day-ci/archive/20260116/202601161419.ILPZxcc9-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260116/202601161419.ILPZxcc9-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202601161419.ILPZxcc9-lkp@intel.com/

All errors (new ones prefixed by >>):

>> drivers/acpi/arm64/iort.c:268:20: error: use of undeclared identifier 'ACPI_IORT_NODE_IWB'; did you mean 'ACPI_IORT_NODE_RMR'?
     268 |             node->type == ACPI_IORT_NODE_IWB) {
         |                           ^~~~~~~~~~~~~~~~~~
         |                           ACPI_IORT_NODE_RMR
   include/acpi/actbl2.h:682:2: note: 'ACPI_IORT_NODE_RMR' declared here
     682 |         ACPI_IORT_NODE_RMR = 0x06,
         |         ^
>> drivers/acpi/arm64/iort.c:305:21: error: incomplete definition of type 'struct acpi_iort_iwb'
     305 |                         device_name = iwb->device_name;
         |                                       ~~~^
   drivers/acpi/arm64/iort.c:271:10: note: forward declaration of 'struct acpi_iort_iwb'
     271 |                 struct acpi_iort_iwb *iwb;
         |                        ^
   drivers/acpi/arm64/iort.c:333:20: error: use of undeclared identifier 'ACPI_IORT_NODE_IWB'; did you mean 'ACPI_IORT_NODE_RMR'?
     333 |         if (node->type != ACPI_IORT_NODE_IWB)
         |                           ^~~~~~~~~~~~~~~~~~
         |                           ACPI_IORT_NODE_RMR
   include/acpi/actbl2.h:682:2: note: 'ACPI_IORT_NODE_RMR' declared here
     682 |         ACPI_IORT_NODE_RMR = 0x06,
         |         ^
   drivers/acpi/arm64/iort.c:337:9: error: incomplete definition of type 'struct acpi_iort_iwb'
     337 |         if (iwb->iwb_index != *id)
         |             ~~~^
   drivers/acpi/arm64/iort.c:330:9: note: forward declaration of 'struct acpi_iort_iwb'
     330 |         struct acpi_iort_iwb *iwb;
         |                ^
   drivers/acpi/arm64/iort.c:349:15: error: use of undeclared identifier 'ACPI_IORT_NODE_IWB'; did you mean 'ACPI_IORT_NODE_RMR'?
     349 |                     type == ACPI_IORT_NODE_IWB             ||
         |                             ^~~~~~~~~~~~~~~~~~
         |                             ACPI_IORT_NODE_RMR
   include/acpi/actbl2.h:682:2: note: 'ACPI_IORT_NODE_RMR' declared here
     682 |         ACPI_IORT_NODE_RMR = 0x06,
         |         ^
   drivers/acpi/arm64/iort.c:419:21: error: use of undeclared identifier 'ACPI_IORT_NODE_IWB'; did you mean 'ACPI_IORT_NODE_RMR'?
     419 |                     node->type == ACPI_IORT_NODE_IWB ||
         |                                   ^~~~~~~~~~~~~~~~~~
         |                                   ACPI_IORT_NODE_RMR
   include/acpi/actbl2.h:682:2: note: 'ACPI_IORT_NODE_RMR' declared here
     682 |         ACPI_IORT_NODE_RMR = 0x06,
         |         ^
   drivers/acpi/arm64/iort.c:597:25: error: use of undeclared identifier 'ACPI_IORT_NODE_IWB'; did you mean 'ACPI_IORT_NODE_RMR'?
     597 |                 return iort_scan_node(ACPI_IORT_NODE_IWB,
         |                                       ^~~~~~~~~~~~~~~~~~
         |                                       ACPI_IORT_NODE_RMR
   include/acpi/actbl2.h:682:2: note: 'ACPI_IORT_NODE_RMR' declared here
     682 |         ACPI_IORT_NODE_RMR = 0x06,
         |         ^
   drivers/acpi/arm64/iort.c:802:24: error: use of undeclared identifier 'ACPI_IORT_NODE_IWB'; did you mean 'ACPI_IORT_NODE_RMR'?
     802 |         node = iort_scan_node(ACPI_IORT_NODE_IWB, iort_match_iwb_callback, &iwb_id);
         |                               ^~~~~~~~~~~~~~~~~~
         |                               ACPI_IORT_NODE_RMR
   include/acpi/actbl2.h:682:2: note: 'ACPI_IORT_NODE_RMR' declared here
     682 |         ACPI_IORT_NODE_RMR = 0x06,
         |         ^
   drivers/acpi/arm64/iort.c:807:36: error: incomplete definition of type 'struct acpi_iort_iwb'
     807 |         status = acpi_get_handle(NULL, iwb->device_name, &handle);
         |                                        ~~~^
   drivers/acpi/arm64/iort.c:797:9: note: forward declaration of 'struct acpi_iort_iwb'
     797 |         struct acpi_iort_iwb *iwb;
         |                ^
   drivers/acpi/arm64/iort.c:883:25: error: use of undeclared identifier 'ACPI_IORT_NODE_IWB'; did you mean 'ACPI_IORT_NODE_RMR'?
     883 |                 node = iort_scan_node(ACPI_IORT_NODE_IWB,
         |                                       ^~~~~~~~~~~~~~~~~~
         |                                       ACPI_IORT_NODE_RMR
   include/acpi/actbl2.h:682:2: note: 'ACPI_IORT_NODE_RMR' declared here
     682 |         ACPI_IORT_NODE_RMR = 0x06,
         |         ^
   10 errors generated.


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
