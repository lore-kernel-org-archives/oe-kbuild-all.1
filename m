Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=192.198.163.17
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1792685432;
	b=yz/FI/GK+CDfwSfabRM3UDnsyqw1GYEhA8OR476kV17To4MtbrUT0kq2WoJ5KDwbIC8N
	 mlh5ubeZPDDsvIBUixt6+D2cV4+IBJpJz0nfhRXMAQELH5tfqb/92UIzffexkTojXAwU+
	 aS0V5dF7d7IDrpScVeKd+cnWqDA6MP+tLkXQEnbK9EizZTFgHBeoHDD2ndW/IiX5dMTzD
	 T1PmZxbp2822ad5sThJUqzgkeP9gTYEG5GeMzlpua8BO3EpFr7p09g0w095oXWGWdd2W5
	 z604Ou8GinT043LDJb1pXWIBE4n9672Bf8QJZ5Bc7plTcPa4IaxfwBIFd9o9zOLkPDw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1792685432;
	h=DMARC-Filter:DKIM-Signature:X-CSE-ConnectionGUID:X-CSE-MsgGUID:
	 X-IronPort-AV:X-IronPort-AV:Received:X-CSE-ConnectionGUID:
	 X-CSE-MsgGUID:X-ExtLoop1:X-IronPort-AV:Received:Received:Date:From:To:
	 Cc:Subject:Message-ID:User-Agent;
	bh=kT4iSgU+MyYYFshXLoFS2twSpRWM3QbTCEdZAh46m8c=;
	b=ToyAyrErcfMrFsGKcrkt8yUtZghlm/c9nt1Vvpm0ZGEfGenEqqxAEQwa+B5QR+MlSvfI
	 vExHuANzPCRlYHLGQuZi7LEUhMP5p1UpHY/qvw95rnL7kX72LkLZAP8zWgLfpwSiRYFU8
	 L5jcg705TY4KgQxrlJJs92KWHvUlQR7i9jg1hPQMo1pkX6TdDDn78Hi9nMTBrznfm4COE
	 j97mEZa3QAj3jfhG73wCy9K1apgF4Qe2Zn6jMg3FSzlVmhhC6ThL6NIUIU0k86M/o/0O8
	 bfhkN0ufRbexAbGfMBYUiHTl9257HM3Lq7Q82+LnMBfgYftb60hk30uZry0EXyUnqKQ==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=intel.com;
	spf=pass smtp.mailfrom=intel.com;
	dkim=pass header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FsHDlZri;
	arc=none smtp.remote-ip=192.198.163.17
Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 08EB4606A31D
	for <oe-kbuild-all@lists.linux.dev>; Thu, 22 Oct 2026 16:10:30 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 08EB4606A31D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=intel.com header.i=@intel.com header.a=rsa-sha256 header.s=Intel header.b=FsHDlZri
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1792685432; x=1824221432;
  h=date:from:to:cc:subject:message-id;
  bh=/oclaNuE+6T65BEYq1YTKc/fjlhBAsbCH+SXw8Pcah4=;
  b=FsHDlZrifQhEw4SmclK851iq9bE6miJthxBExFIneJ/FLXX4O8h6K/hp
   cJSNw94NL3Rx5av6YfWnxqZKwuuvbc/rlfHusS/7YDifwdi/og4HFcO3q
   4MCSna3tJsC1vxkHd5vffkz4wlsVi4CvSS98ElgUW/0Cwtq6z6BLbDM8c
   v7ORMf1vHYnpMMZBCGOC3LlzJs4qHrtBU70NHDDs0DCN1TIUvbSua+RYv
   0li2xBgBwtZdkZdesvd8wodkn1auK7gAqOOc02uNAesBwCgYUcZrLSDMc
   2tI5FW4xyQHqA5xw33JpgIFaZVO7un57BznDpq2VqkByv5SVpqmnACGGF
   A==;
X-CSE-ConnectionGUID: ZAkYPIabTt6FR2WJDB+JOg==
X-CSE-MsgGUID: W4F/sn4ZQfSIBDdU66Teww==
X-IronPort-AV: E=McAfee;i="6800,10657,11942"; a="1446812"
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="1446812"
Received: from orviesa003.jf.intel.com ([10.64.159.143])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 Oct 2026 09:10:31 -0700
X-CSE-ConnectionGUID: FRTFlUr+SROvjzlBFvJULg==
X-CSE-MsgGUID: lN3vNRKHS+6GsoVbFJFsSQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.27,172,1787036400"; 
   d="scan'208";a="3316707"
Received: from lkp-server01.sh.intel.com (HELO 0caa9d2d175c) ([10.239.97.150])
  by orviesa003.jf.intel.com with ESMTP; 22 Oct 2026 09:10:29 -0700
Received: from kbuild by 0caa9d2d175c with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1xJvN4-00000000RJl-3fel;
	Thu, 22 Oct 2026 16:10:26 +0000
Date: Fri, 23 Oct 2026 00:10:14 +0800
From: kernel test robot <lkp@intel.com>
To: Bard Liao <yung-chuan.liao@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [thesofproject:topic/sof-dev 9451/9453]
 sound/soc/sof/amd/acp7x.c:180:45: error: assignment to 'int (*)(struct
 snd_sof_dev *, const char *)' from incompatible pointer type 'int (*)(struct
 snd_sof_dev *)'
Message-ID: <202610230026.Sb41drsw-lkp@intel.com>
User-Agent: s-nail v14.9.25
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Post: <mailto:oe-kbuild-all@lists.linux.dev>
List-Help: <mailto:oe-kbuild-all+help@lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
List-Owner: <mailto:oe-kbuild-all+owner@lists.linux.dev>
Precedence: list

tree:   https://github.com/thesofproject/linux topic/sof-dev
head:   fc5eeea8dbdc973a5994c5ab91fc9daade2673e3
commit: ec69dd1e9c24d7b84073055d0fd87c436919a6b0 [9451/9453] Merge branch 'sound/upstream-20261015' into merge/sound-upstream-20261015
config: i386-allmodconfig (https://download.01.org/0day-ci/archive/20261023/202610230026.Sb41drsw-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20261023/202610230026.Sb41drsw-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202610230026.Sb41drsw-lkp@intel.com/

Note: the thesofproject/topic/sof-dev HEAD fc5eeea8dbdc973a5994c5ab91fc9daade2673e3 builds fine.
      It only hurts bisectability.

All errors (new ones prefixed by >>):

   sound/soc/sof/amd/acp7x.c: In function 'sof_acp7x_ops_init':
>> sound/soc/sof/amd/acp7x.c:180:45: error: assignment to 'int (*)(struct snd_sof_dev *, const char *)' from incompatible pointer type 'int (*)(struct snd_sof_dev *)' [-Wincompatible-pointer-types]
     180 |                 sof_acp7x_ops.load_firmware = acp7x_load_firmware_carveout;
         |                                             ^


vim +180 sound/soc/sof/amd/acp7x.c

0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  147  
0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  148  int sof_acp7x_ops_init(struct snd_sof_dev *sdev)
0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  149  {
7a81f54a0483edc Vijendar Mukunda 2026-07-01  150  	struct acpi_device *adev = ACPI_COMPANION(&to_pci_dev(sdev->dev)->dev);
7a81f54a0483edc Vijendar Mukunda 2026-07-01  151  	const union acpi_object *obj;
7af6ac41cd470b0 Vijendar Mukunda 2026-07-01  152  	int acp_sof_signed_firmware_image = 0;
7a81f54a0483edc Vijendar Mukunda 2026-07-01  153  	int acp_sof_post_fw_run_delay = 0;
7a81f54a0483edc Vijendar Mukunda 2026-07-01  154  
0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  155  	/* common defaults */
0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  156  	memcpy(&sof_acp7x_ops, &sof_acp_common_ops, sizeof(struct snd_sof_dsp_ops));
0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  157  
0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  158  	sof_acp7x_ops.drv = acp7x_sof_dai;
0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  159  	sof_acp7x_ops.num_drv = ARRAY_SIZE(acp7x_sof_dai);
78d99c2c5eee0f6 Vijendar Mukunda 2026-07-01  160  	sof_acp7x_ops.probe = amd_sof_acp7x_probe;
78d99c2c5eee0f6 Vijendar Mukunda 2026-07-01  161  	sof_acp7x_ops.remove = amd_sof_acp7x_remove;
0ec5afad9d31c4f Vijendar Mukunda 2026-07-01  162  
7a81f54a0483edc Vijendar Mukunda 2026-07-01  163  	if (adev) {
7af6ac41cd470b0 Vijendar Mukunda 2026-07-01  164  		if (!acpi_dev_get_property(adev, "acp-sof-signed-firmware-image",
7af6ac41cd470b0 Vijendar Mukunda 2026-07-01  165  					   ACPI_TYPE_INTEGER, &obj))
7af6ac41cd470b0 Vijendar Mukunda 2026-07-01  166  			acp_sof_signed_firmware_image = obj->integer.value;
7af6ac41cd470b0 Vijendar Mukunda 2026-07-01  167  
7a81f54a0483edc Vijendar Mukunda 2026-07-01  168  		if (!acpi_dev_get_property(adev, "acp-sof-post_fw_run_delay",
7a81f54a0483edc Vijendar Mukunda 2026-07-01  169  					   ACPI_TYPE_INTEGER, &obj))
7a81f54a0483edc Vijendar Mukunda 2026-07-01  170  			acp_sof_post_fw_run_delay = obj->integer.value;
7a81f54a0483edc Vijendar Mukunda 2026-07-01  171  	}
7a81f54a0483edc Vijendar Mukunda 2026-07-01  172  
cec3598305a6df3 Vijendar Mukunda 2026-10-13  173  	if (acp_sof_signed_firmware_image) {
cec3598305a6df3 Vijendar Mukunda 2026-10-13  174  		/*
cec3598305a6df3 Vijendar Mukunda 2026-10-13  175  		 * This driver handles only ACP7.B/7.F which both use the ASP
cec3598305a6df3 Vijendar Mukunda 2026-10-13  176  		 * carveout firmware load path. Assign unconditionally rather
cec3598305a6df3 Vijendar Mukunda 2026-10-13  177  		 * than rechecking the revision so the correct loader is always
cec3598305a6df3 Vijendar Mukunda 2026-10-13  178  		 * selected when signed firmware is enabled.
cec3598305a6df3 Vijendar Mukunda 2026-10-13  179  		 */
cec3598305a6df3 Vijendar Mukunda 2026-10-13 @180  		sof_acp7x_ops.load_firmware = acp7x_load_firmware_carveout;

:::::: The code at line 180 was first introduced by commit
:::::: cec3598305a6df306fc4eb0c49a72e0f9949c06f ASoC: SOF: amd: add ASP carveout firmware loading for ACP7.B/7.F

:::::: TO: Vijendar Mukunda <Vijendar.Mukunda@amd.com>
:::::: CC: Mark Brown <broonie@kernel.org>

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
