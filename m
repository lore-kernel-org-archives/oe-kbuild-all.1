Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 27C7913C9D9
	for <oe-kbuild-all@lists.linux.dev>; Sun,  5 Jan 2025 09:58:28 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1736071111; cv=none; b=RurN2kuOKcxSznDEOhuFhhFL+QwqJ0UcTGhPL9ys8ZnOkXGxab+OBkVAOzUpX1o82hRbafkhldzCEGxbHRUW/BzEMQIn+kyX3x8N9cWqVFKXWBB3Eh4Ib3hKiUQTREtvIsBhIsH0phDVbGaCQNOj6ezeK+lugxER/gt6k8kJoes=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1736071111; c=relaxed/simple;
	bh=VScAM5uQn5WfL15gRTU+PQeAKdIkrKJQc/GZSzVBdrM=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=OASRUKxxtTyugfOpev+RAu9/yu21vNp4cO2ykMXBPIgoj7i0xUM4bSs/fLfesOo5NweI+bGKUf/AcnC/UwoYiyQfU2vLPrijSYbI27g8c6h2bXHRCRScYPqnYqqPOswTYFOUGUZRJhSMq9RlICbl8MtWKMDZCNdCQzM/ASxNmOY=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UejoCitH; arc=none smtp.client-ip=198.175.65.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UejoCitH"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1736071109; x=1767607109;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=VScAM5uQn5WfL15gRTU+PQeAKdIkrKJQc/GZSzVBdrM=;
  b=UejoCitH7Fj3ifE3RmN2CI5otVfaDFLvGlxwNdhRfrbu9e5Vz+QgIRsE
   VX3kIiwT845s6m0Huq4pzfLKeSTwcDtpP6htWD86ou8PQu5b0YvEi1S3W
   6e83YXpKQyqccSMRZ122lK9jjcwoSIRnm8luXiCcxZScHlO6GmcFMpiw1
   79T2MkOR7jVkIz+qyYVyribnhrcJE+aWd13VREftqaIEloGDgRAAPyJ9q
   KPK3natHUGQnorm8NmOPOGDPO7CnTuxMpZej1dJpi/7RGXEsqyK/lBTTp
   jM0e0HKTr18woJ+8dqj+DERxGnFyLa1Ds6j4h7DRRGbOgd2wfXSAfggrv
   g==;
X-CSE-ConnectionGUID: LRfcbnj9RgGBsRIT0O0AvQ==
X-CSE-MsgGUID: v1yZq+X8TbmixheYsQ77oA==
X-IronPort-AV: E=McAfee;i="6700,10204,11305"; a="36396643"
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="36396643"
Received: from fmviesa004.fm.intel.com ([10.60.135.144])
  by orvoesa108.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 05 Jan 2025 01:58:28 -0800
X-CSE-ConnectionGUID: h7L9bMmNTFiB/lSJ69jjFg==
X-CSE-MsgGUID: KlvA021ETZSSz09hnxreTw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.12,290,1728975600"; 
   d="scan'208";a="107029650"
Received: from lkp-server01.sh.intel.com (HELO d63d4d77d921) ([10.239.97.150])
  by fmviesa004.fm.intel.com with ESMTP; 05 Jan 2025 01:58:25 -0800
Received: from kbuild by d63d4d77d921 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tUNOp-000Bbv-1m;
	Sun, 05 Jan 2025 09:58:23 +0000
Date: Sun, 5 Jan 2025 17:58:10 +0800
From: kernel test robot <lkp@intel.com>
To: Javed Hasan <jhasan@marvell.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
	"Martin K. Petersen" <martin.petersen@oracle.com>,
	Himanshu Madhani <himanshu.madhani@oracle.com>
Subject: drivers/scsi/libfc/fc_encode.h:357:30: warning: '%s' directive
 output may be truncated writing up to 64 bytes into a region of size between
 62 and 126
Message-ID: <202501051751.jg65wgwM-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git master
head:   ab75170520d4964f3acf8bb1f91d34cbc650688e
commit: 49d3e5996155a3067782748b0c4edf0309e951b6 scsi: fc: FDMI enhancement
date:   3 years, 7 months ago
config: parisc-randconfig-c44-20220907 (https://download.01.org/0day-ci/archive/20250105/202501051751.jg65wgwM-lkp@intel.com/config)
compiler: hppa-linux-gcc (GCC) 12.4.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250105/202501051751.jg65wgwM-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202501051751.jg65wgwM-lkp@intel.com/

All warnings (new ones prefixed by >>):

   In file included from drivers/scsi/libfc/fc_elsct.c:18:
   drivers/scsi/libfc/fc_encode.h: In function 'fc_ct_ns_fill':
   drivers/scsi/libfc/fc_encode.h:153:17: warning: 'strncpy' output may be truncated copying between 0 and 255 bytes from a string of length 255 [-Wstringop-truncation]
     153 |                 strncpy(ct->payload.snn.fr_name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     154 |                         fc_host_symbolic_name(lport->host), len);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libfc/fc_encode.h:143:17: warning: 'strncpy' output may be truncated copying between 0 and 255 bytes from a string of length 255 [-Wstringop-truncation]
     143 |                 strncpy(ct->payload.spn.fr_name,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     144 |                         fc_host_symbolic_name(lport->host), len);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libfc/fc_encode.h: In function 'fc_ct_ms_fill.constprop':
>> drivers/scsi/libfc/fc_encode.h:357:30: warning: '%s' directive output may be truncated writing up to 64 bytes into a region of size between 62 and 126 [-Wformat-truncation=]
     357 |                         "%s v%s",
         |                              ^~
     358 |                         init_utsname()->sysname,
     359 |                         init_utsname()->release);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~
   drivers/scsi/libfc/fc_encode.h:355:17: note: 'snprintf' output between 3 and 131 bytes into a destination of size 128
     355 |                 snprintf((char *)&entry->value,
         |                 ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     356 |                         FC_FDMI_HBA_ATTR_OSNAMEVERSION_LEN,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
     357 |                         "%s v%s",
         |                         ~~~~~~~~~
     358 |                         init_utsname()->sysname,
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~
     359 |                         init_utsname()->release);
         |                         ~~~~~~~~~~~~~~~~~~~~~~~~


vim +357 drivers/scsi/libfc/fc_encode.h

8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  175  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  176  /**
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  177   * fc_ct_ms_fill() - Fill in a mgmt service request frame
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  178   * @lport: local port.
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  179   * @fc_id: FC_ID of non-destination rport for GPN_ID and similar inquiries.
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  180   * @fp: frame to contain payload.
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  181   * @op: CT opcode.
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  182   * @r_ctl: pointer to FC header R_CTL.
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  183   * @fh_type: pointer to FC-4 type.
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  184   */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  185  static inline int fc_ct_ms_fill(struct fc_lport *lport,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  186  		      u32 fc_id, struct fc_frame *fp,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  187  		      unsigned int op, enum fc_rctl *r_ctl,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  188  		      enum fc_fh_type *fh_type)
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  189  {
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  190  	struct fc_ct_req *ct;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  191  	size_t len;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  192  	struct fc_fdmi_attr_entry *entry;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  193  	struct fs_fdmi_attrs *hba_attrs;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  194  	int numattrs = 0;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  195  	struct fc_host_attrs *fc_host = shost_to_fc_host(lport->host);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  196  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  197  	switch (op) {
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  198  	case FC_FDMI_RHBA:
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  199  		numattrs = 11;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  200  		len = sizeof(struct fc_fdmi_rhba);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  201  		len -= sizeof(struct fc_fdmi_attr_entry);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  202  		len += (numattrs * FC_FDMI_ATTR_ENTRY_HEADER_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  203  		len += FC_FDMI_HBA_ATTR_NODENAME_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  204  		len += FC_FDMI_HBA_ATTR_MANUFACTURER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  205  		len += FC_FDMI_HBA_ATTR_SERIALNUMBER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  206  		len += FC_FDMI_HBA_ATTR_MODEL_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  207  		len += FC_FDMI_HBA_ATTR_MODELDESCR_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  208  		len += FC_FDMI_HBA_ATTR_HARDWAREVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  209  		len += FC_FDMI_HBA_ATTR_DRIVERVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  210  		len += FC_FDMI_HBA_ATTR_OPTIONROMVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  211  		len += FC_FDMI_HBA_ATTR_FIRMWAREVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  212  		len += FC_FDMI_HBA_ATTR_OSNAMEVERSION_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  213  		len += FC_FDMI_HBA_ATTR_MAXCTPAYLOAD_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  214  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  215  		if (fc_host->fdmi_version == FDMI_V2) {
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  216  			numattrs += 7;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  217  			len += FC_FDMI_HBA_ATTR_NODESYMBLNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  218  			len += FC_FDMI_HBA_ATTR_VENDORSPECIFICINFO_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  219  			len += FC_FDMI_HBA_ATTR_NUMBEROFPORTS_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  220  			len += FC_FDMI_HBA_ATTR_FABRICNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  221  			len += FC_FDMI_HBA_ATTR_BIOSVERSION_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  222  			len += FC_FDMI_HBA_ATTR_BIOSSTATE_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  223  			len += FC_FDMI_HBA_ATTR_VENDORIDENTIFIER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  224  		}
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  225  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  226  		ct = fc_ct_hdr_fill(fp, op, len, FC_FST_MGMT,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  227  				FC_FDMI_SUBTYPE);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  228  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  229  		/* HBA Identifier */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  230  		put_unaligned_be64(lport->wwpn, &ct->payload.rhba.hbaid.id);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  231  		/* Number of Ports - always 1 */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  232  		put_unaligned_be32(1, &ct->payload.rhba.port.numport);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  233  		/* Port Name */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  234  		put_unaligned_be64(lport->wwpn,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  235  				   &ct->payload.rhba.port.port[0].portname);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  236  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  237  		/* HBA Attributes */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  238  		put_unaligned_be32(numattrs,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  239  				   &ct->payload.rhba.hba_attrs.numattrs);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  240  		hba_attrs = &ct->payload.rhba.hba_attrs;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  241  		entry = (struct fc_fdmi_attr_entry *)hba_attrs->attr;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  242  		/* NodeName*/
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  243  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  244  		len += FC_FDMI_HBA_ATTR_NODENAME_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  245  		put_unaligned_be16(FC_FDMI_HBA_ATTR_NODENAME,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  246  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  247  		put_unaligned_be16(len, &entry->len);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  248  		put_unaligned_be64(lport->wwnn,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  249  				   (__be64 *)&entry->value[0]);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  250  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  251  		/* Manufacturer */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  252  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  253  					FC_FDMI_HBA_ATTR_NODENAME_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  254  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  255  		len += FC_FDMI_HBA_ATTR_MANUFACTURER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  256  		put_unaligned_be16(FC_FDMI_HBA_ATTR_MANUFACTURER,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  257  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  258  		put_unaligned_be16(len, &entry->len);
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  259  		fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  260  			fc_host_manufacturer(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  261  			FC_FDMI_HBA_ATTR_MANUFACTURER_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  262  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  263  		/* SerialNumber */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  264  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  265  					FC_FDMI_HBA_ATTR_MANUFACTURER_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  266  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  267  		len += FC_FDMI_HBA_ATTR_SERIALNUMBER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  268  		put_unaligned_be16(FC_FDMI_HBA_ATTR_SERIALNUMBER,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  269  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  270  		put_unaligned_be16(len, &entry->len);
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  271  		fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  272  			fc_host_serial_number(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  273  			FC_FDMI_HBA_ATTR_SERIALNUMBER_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  274  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  275  		/* Model */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  276  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  277  					FC_FDMI_HBA_ATTR_SERIALNUMBER_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  278  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  279  		len += FC_FDMI_HBA_ATTR_MODEL_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  280  		put_unaligned_be16(FC_FDMI_HBA_ATTR_MODEL,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  281  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  282  		put_unaligned_be16(len, &entry->len);
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  283  		fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  284  			fc_host_model(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  285  			FC_FDMI_HBA_ATTR_MODEL_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  286  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  287  		/* Model Description */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  288  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  289  					FC_FDMI_HBA_ATTR_MODEL_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  290  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  291  		len += FC_FDMI_HBA_ATTR_MODELDESCR_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  292  		put_unaligned_be16(FC_FDMI_HBA_ATTR_MODELDESCRIPTION,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  293  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  294  		put_unaligned_be16(len, &entry->len);
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  295  		fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  296  			fc_host_model_description(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  297  			FC_FDMI_HBA_ATTR_MODELDESCR_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  298  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  299  		/* Hardware Version */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  300  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  301  					FC_FDMI_HBA_ATTR_MODELDESCR_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  302  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  303  		len += FC_FDMI_HBA_ATTR_HARDWAREVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  304  		put_unaligned_be16(FC_FDMI_HBA_ATTR_HARDWAREVERSION,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  305  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  306  		put_unaligned_be16(len, &entry->len);
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  307  		fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  308  			fc_host_hardware_version(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  309  			FC_FDMI_HBA_ATTR_HARDWAREVERSION_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  310  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  311  		/* Driver Version */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  312  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  313  					FC_FDMI_HBA_ATTR_HARDWAREVERSION_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  314  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  315  		len += FC_FDMI_HBA_ATTR_DRIVERVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  316  		put_unaligned_be16(FC_FDMI_HBA_ATTR_DRIVERVERSION,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  317  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  318  		put_unaligned_be16(len, &entry->len);
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  319  		fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  320  			fc_host_driver_version(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  321  			FC_FDMI_HBA_ATTR_DRIVERVERSION_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  322  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  323  		/* OptionROM Version */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  324  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  325  					FC_FDMI_HBA_ATTR_DRIVERVERSION_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  326  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  327  		len += FC_FDMI_HBA_ATTR_OPTIONROMVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  328  		put_unaligned_be16(FC_FDMI_HBA_ATTR_OPTIONROMVERSION,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  329  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  330  		put_unaligned_be16(len, &entry->len);
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  331  		fc_ct_ms_fill_attr(entry,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  332  			"unknown",
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  333  			FC_FDMI_HBA_ATTR_OPTIONROMVERSION_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  334  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  335  		/* Firmware Version */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  336  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  337  					FC_FDMI_HBA_ATTR_OPTIONROMVERSION_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  338  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  339  		len += FC_FDMI_HBA_ATTR_FIRMWAREVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  340  		put_unaligned_be16(FC_FDMI_HBA_ATTR_FIRMWAREVERSION,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  341  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  342  		put_unaligned_be16(len, &entry->len);
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  343  		fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  344  			fc_host_firmware_version(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  345  			FC_FDMI_HBA_ATTR_FIRMWAREVERSION_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  346  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  347  		/* OS Name and Version */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  348  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  349  					FC_FDMI_HBA_ATTR_FIRMWAREVERSION_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  350  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  351  		len += FC_FDMI_HBA_ATTR_OSNAMEVERSION_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  352  		put_unaligned_be16(FC_FDMI_HBA_ATTR_OSNAMEVERSION,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  353  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  354  		put_unaligned_be16(len, &entry->len);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  355  		snprintf((char *)&entry->value,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  356  			FC_FDMI_HBA_ATTR_OSNAMEVERSION_LEN,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22 @357  			"%s v%s",
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  358  			init_utsname()->sysname,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  359  			init_utsname()->release);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  360  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  361  		/* Max CT payload */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  362  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  363  					FC_FDMI_HBA_ATTR_OSNAMEVERSION_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  364  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  365  		len += FC_FDMI_HBA_ATTR_MAXCTPAYLOAD_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  366  		put_unaligned_be16(FC_FDMI_HBA_ATTR_MAXCTPAYLOAD,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  367  				&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  368  		put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  369  		put_unaligned_be32(fc_host_max_ct_payload(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  370  				&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  371  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  372  		if (fc_host->fdmi_version == FDMI_V2) {
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  373  			/* Node symbolic name */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  374  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  375  					FC_FDMI_HBA_ATTR_MAXCTPAYLOAD_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  376  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  377  			len += FC_FDMI_HBA_ATTR_NODESYMBLNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  378  			put_unaligned_be16(FC_FDMI_HBA_ATTR_NODESYMBLNAME,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  379  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  380  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  381  			fc_ct_ms_fill_attr(entry,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  382  					fc_host_symbolic_name(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  383  					FC_FDMI_HBA_ATTR_NODESYMBLNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  384  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  385  			/* Vendor specific info */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  386  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  387  					FC_FDMI_HBA_ATTR_NODESYMBLNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  388  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  389  			len += FC_FDMI_HBA_ATTR_VENDORSPECIFICINFO_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  390  			put_unaligned_be16(FC_FDMI_HBA_ATTR_VENDORSPECIFICINFO,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  391  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  392  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  393  			put_unaligned_be32(0,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  394  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  395  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  396  			/* Number of ports */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  397  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  398  					FC_FDMI_HBA_ATTR_VENDORSPECIFICINFO_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  399  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  400  			len += FC_FDMI_HBA_ATTR_NUMBEROFPORTS_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  401  			put_unaligned_be16(FC_FDMI_HBA_ATTR_NUMBEROFPORTS,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  402  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  403  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  404  			put_unaligned_be32(fc_host_num_ports(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  405  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  406  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  407  			/* Fabric name */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  408  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  409  					FC_FDMI_HBA_ATTR_NUMBEROFPORTS_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  410  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  411  			len += FC_FDMI_HBA_ATTR_FABRICNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  412  			put_unaligned_be16(FC_FDMI_HBA_ATTR_FABRICNAME,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  413  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  414  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  415  			put_unaligned_be64(fc_host_fabric_name(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  416  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  417  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  418  			/* BIOS version */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  419  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  420  					FC_FDMI_HBA_ATTR_FABRICNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  421  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  422  			len += FC_FDMI_HBA_ATTR_BIOSVERSION_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  423  			put_unaligned_be16(FC_FDMI_HBA_ATTR_BIOSVERSION,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  424  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  425  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  426  			fc_ct_ms_fill_attr(entry,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  427  					fc_host_bootbios_version(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  428  					FC_FDMI_HBA_ATTR_BIOSVERSION_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  429  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  430  			/* BIOS state */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  431  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  432  					FC_FDMI_HBA_ATTR_BIOSVERSION_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  433  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  434  			len += FC_FDMI_HBA_ATTR_BIOSSTATE_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  435  			put_unaligned_be16(FC_FDMI_HBA_ATTR_BIOSSTATE,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  436  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  437  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  438  			put_unaligned_be32(fc_host_bootbios_state(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  439  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  440  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  441  			/* Vendor identifier  */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  442  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  443  					FC_FDMI_HBA_ATTR_BIOSSTATE_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  444  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  445  			len += FC_FDMI_HBA_ATTR_VENDORIDENTIFIER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  446  			put_unaligned_be16(FC_FDMI_HBA_ATTR_VENDORIDENTIFIER,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  447  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  448  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  449  			fc_ct_ms_fill_attr(entry,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  450  					fc_host_vendor_identifier(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  451  					FC_FDMI_HBA_ATTR_VENDORIDENTIFIER_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  452  		}
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  453  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  454  		break;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  455  	case FC_FDMI_RPA:
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  456  		numattrs = 6;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  457  		len = sizeof(struct fc_fdmi_rpa);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  458  		len -= sizeof(struct fc_fdmi_attr_entry);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  459  		len += (numattrs * FC_FDMI_ATTR_ENTRY_HEADER_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  460  		len += FC_FDMI_PORT_ATTR_FC4TYPES_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  461  		len += FC_FDMI_PORT_ATTR_SUPPORTEDSPEED_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  462  		len += FC_FDMI_PORT_ATTR_CURRENTPORTSPEED_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  463  		len += FC_FDMI_PORT_ATTR_MAXFRAMESIZE_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  464  		len += FC_FDMI_PORT_ATTR_OSDEVICENAME_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  465  		len += FC_FDMI_PORT_ATTR_HOSTNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  466  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  467  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  468  		if (fc_host->fdmi_version == FDMI_V2) {
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  469  			numattrs += 10;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  470  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  471  			len += FC_FDMI_PORT_ATTR_NODENAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  472  			len += FC_FDMI_PORT_ATTR_PORTNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  473  			len += FC_FDMI_PORT_ATTR_SYMBOLICNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  474  			len += FC_FDMI_PORT_ATTR_PORTTYPE_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  475  			len += FC_FDMI_PORT_ATTR_SUPPORTEDCLASSSRVC_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  476  			len += FC_FDMI_PORT_ATTR_FABRICNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  477  			len += FC_FDMI_PORT_ATTR_CURRENTFC4TYPE_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  478  			len += FC_FDMI_PORT_ATTR_PORTSTATE_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  479  			len += FC_FDMI_PORT_ATTR_DISCOVEREDPORTS_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  480  			len += FC_FDMI_PORT_ATTR_PORTID_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  481  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  482  		}
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  483  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  484  		ct = fc_ct_hdr_fill(fp, op, len, FC_FST_MGMT,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  485  				    FC_FDMI_SUBTYPE);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  486  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  487  		/* Port Name */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  488  		put_unaligned_be64(lport->wwpn,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  489  				   &ct->payload.rpa.port.portname);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  490  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  491  		/* Port Attributes */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  492  		put_unaligned_be32(numattrs,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  493  				   &ct->payload.rpa.hba_attrs.numattrs);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  494  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  495  		hba_attrs = &ct->payload.rpa.hba_attrs;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  496  		entry = (struct fc_fdmi_attr_entry *)hba_attrs->attr;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  497  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  498  		/* FC4 types */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  499  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  500  		len += FC_FDMI_PORT_ATTR_FC4TYPES_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  501  		put_unaligned_be16(FC_FDMI_PORT_ATTR_FC4TYPES,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  502  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  503  		put_unaligned_be16(len, &entry->len);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  504  		memcpy(&entry->value, fc_host_supported_fc4s(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  505  		       FC_FDMI_PORT_ATTR_FC4TYPES_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  506  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  507  		/* Supported Speed */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  508  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  509  					FC_FDMI_PORT_ATTR_FC4TYPES_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  510  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  511  		len += FC_FDMI_PORT_ATTR_SUPPORTEDSPEED_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  512  		put_unaligned_be16(FC_FDMI_PORT_ATTR_SUPPORTEDSPEED,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  513  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  514  		put_unaligned_be16(len, &entry->len);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  515  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  516  		put_unaligned_be32(fc_host_supported_speeds(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  517  				   &entry->value);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  518  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  519  		/* Current Port Speed */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  520  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  521  					FC_FDMI_PORT_ATTR_SUPPORTEDSPEED_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  522  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  523  		len += FC_FDMI_PORT_ATTR_CURRENTPORTSPEED_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  524  		put_unaligned_be16(FC_FDMI_PORT_ATTR_CURRENTPORTSPEED,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  525  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  526  		put_unaligned_be16(len, &entry->len);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  527  		put_unaligned_be32(lport->link_speed,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  528  				   &entry->value);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  529  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  530  		/* Max Frame Size */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  531  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  532  					FC_FDMI_PORT_ATTR_CURRENTPORTSPEED_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  533  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  534  		len += FC_FDMI_PORT_ATTR_MAXFRAMESIZE_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  535  		put_unaligned_be16(FC_FDMI_PORT_ATTR_MAXFRAMESIZE,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  536  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  537  		put_unaligned_be16(len, &entry->len);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  538  		put_unaligned_be32(fc_host_maxframe_size(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  539  				   &entry->value);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  540  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  541  		/* OS Device Name */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  542  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  543  					FC_FDMI_PORT_ATTR_MAXFRAMESIZE_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  544  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  545  		len += FC_FDMI_PORT_ATTR_OSDEVICENAME_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  546  		put_unaligned_be16(FC_FDMI_PORT_ATTR_OSDEVICENAME,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  547  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  548  		put_unaligned_be16(len, &entry->len);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  549  		/* Use the sysfs device name */
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  550  		fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  551  			dev_name(&lport->host->shost_gendev),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  552  			strnlen(dev_name(&lport->host->shost_gendev),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  553  				FC_FDMI_PORT_ATTR_HOSTNAME_LEN));
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  554  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  555  		/* Host Name */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  556  		entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  557  					FC_FDMI_PORT_ATTR_OSDEVICENAME_LEN);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  558  		len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  559  		len += FC_FDMI_PORT_ATTR_HOSTNAME_LEN;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  560  		put_unaligned_be16(FC_FDMI_PORT_ATTR_HOSTNAME,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  561  				   &entry->type);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  562  		put_unaligned_be16(len, &entry->len);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  563  		if (strlen(fc_host_system_hostname(lport->host)))
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  564  			fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  565  				fc_host_system_hostname(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  566  				strnlen(fc_host_system_hostname(lport->host),
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  567  					FC_FDMI_PORT_ATTR_HOSTNAME_LEN));
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  568  		else
8fd9efca86d083 drivers/scsi/libfc/fc_encode.h Arnd Bergmann 2020-10-26  569  			fc_ct_ms_fill_attr(entry,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  570  				init_utsname()->nodename,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  571  				FC_FDMI_PORT_ATTR_HOSTNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  572  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  573  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  574  		if (fc_host->fdmi_version == FDMI_V2) {
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  575  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  576  			/* Node name */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  577  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  578  					FC_FDMI_PORT_ATTR_HOSTNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  579  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  580  			len += FC_FDMI_PORT_ATTR_NODENAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  581  			put_unaligned_be16(FC_FDMI_PORT_ATTR_NODENAME,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  582  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  583  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  584  			put_unaligned_be64(fc_host_node_name(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  585  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  586  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  587  			/* Port name  */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  588  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  589  					FC_FDMI_PORT_ATTR_NODENAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  590  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  591  			len += FC_FDMI_PORT_ATTR_PORTNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  592  			put_unaligned_be16(FC_FDMI_PORT_ATTR_PORTNAME,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  593  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  594  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  595  			put_unaligned_be64(lport->wwpn,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  596  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  597  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  598  			/* Port symbolic name */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  599  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  600  					FC_FDMI_PORT_ATTR_PORTNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  601  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  602  			len += FC_FDMI_PORT_ATTR_SYMBOLICNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  603  			put_unaligned_be16(FC_FDMI_PORT_ATTR_SYMBOLICNAME,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  604  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  605  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  606  			fc_ct_ms_fill_attr(entry,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  607  					fc_host_symbolic_name(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  608  					FC_FDMI_PORT_ATTR_SYMBOLICNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  609  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  610  			/* Port type */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  611  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  612  					FC_FDMI_PORT_ATTR_SYMBOLICNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  613  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  614  			len += FC_FDMI_PORT_ATTR_PORTTYPE_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  615  			put_unaligned_be16(FC_FDMI_PORT_ATTR_PORTTYPE,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  616  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  617  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  618  			put_unaligned_be32(fc_host_port_type(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  619  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  620  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  621  			/* Supported class of service */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  622  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  623  					FC_FDMI_PORT_ATTR_PORTTYPE_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  624  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  625  			len += FC_FDMI_PORT_ATTR_SUPPORTEDCLASSSRVC_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  626  			put_unaligned_be16(FC_FDMI_PORT_ATTR_SUPPORTEDCLASSSRVC,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  627  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  628  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  629  			put_unaligned_be32(fc_host_supported_classes(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  630  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  631  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  632  			/* Port Fabric name */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  633  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  634  					FC_FDMI_PORT_ATTR_SUPPORTEDCLASSSRVC_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  635  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  636  			len += FC_FDMI_PORT_ATTR_FABRICNAME_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  637  			put_unaligned_be16(FC_FDMI_PORT_ATTR_FABRICNAME,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  638  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  639  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  640  			put_unaligned_be64(fc_host_fabric_name(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  641  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  642  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  643  			/* Port active FC-4 */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  644  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  645  					FC_FDMI_PORT_ATTR_FABRICNAME_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  646  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  647  			len += FC_FDMI_PORT_ATTR_CURRENTFC4TYPE_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  648  			put_unaligned_be16(FC_FDMI_PORT_ATTR_CURRENTFC4TYPE,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  649  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  650  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  651  			memcpy(&entry->value, fc_host_active_fc4s(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  652  					FC_FDMI_PORT_ATTR_CURRENTFC4TYPE_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  653  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  654  			/* Port state */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  655  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  656  					FC_FDMI_PORT_ATTR_CURRENTFC4TYPE_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  657  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  658  			len += FC_FDMI_PORT_ATTR_PORTSTATE_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  659  			put_unaligned_be16(FC_FDMI_PORT_ATTR_PORTSTATE,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  660  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  661  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  662  			put_unaligned_be32(fc_host_port_state(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  663  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  664  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  665  			/* Discovered ports */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  666  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  667  					FC_FDMI_PORT_ATTR_PORTSTATE_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  668  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  669  			len += FC_FDMI_PORT_ATTR_DISCOVEREDPORTS_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  670  			put_unaligned_be16(FC_FDMI_PORT_ATTR_DISCOVEREDPORTS,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  671  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  672  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  673  			put_unaligned_be32(fc_host_num_discovered_ports(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  674  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  675  
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  676  			/* Port ID */
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  677  			entry = (struct fc_fdmi_attr_entry *)((char *)entry->value +
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  678  					FC_FDMI_PORT_ATTR_DISCOVEREDPORTS_LEN);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  679  			len = FC_FDMI_ATTR_ENTRY_HEADER_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  680  			len += FC_FDMI_PORT_ATTR_PORTID_LEN;
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  681  			put_unaligned_be16(FC_FDMI_PORT_ATTR_PORTID,
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  682  					&entry->type);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  683  			put_unaligned_be16(len, &entry->len);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  684  			put_unaligned_be32(fc_host_port_id(lport->host),
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  685  					&entry->value);
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  686  		}
82897fefab6811 drivers/scsi/libfc/fc_encode.h Javed Hasan   2021-06-03  687  
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  688  		break;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  689  	case FC_FDMI_DPRT:
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  690  		len = sizeof(struct fc_fdmi_dprt);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  691  		ct = fc_ct_hdr_fill(fp, op, len, FC_FST_MGMT,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  692  				    FC_FDMI_SUBTYPE);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  693  		/* Port Name */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  694  		put_unaligned_be64(lport->wwpn,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  695  				   &ct->payload.dprt.port.portname);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  696  		break;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  697  	case FC_FDMI_DHBA:
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  698  		len = sizeof(struct fc_fdmi_dhba);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  699  		ct = fc_ct_hdr_fill(fp, op, len, FC_FST_MGMT,
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  700  				    FC_FDMI_SUBTYPE);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  701  		/* HBA Identifier */
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  702  		put_unaligned_be64(lport->wwpn, &ct->payload.dhba.hbaid.id);
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  703  		break;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  704  	default:
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  705  		return -EINVAL;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  706  	}
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  707  	*r_ctl = FC_RCTL_DD_UNSOL_CTL;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  708  	*fh_type = FC_TYPE_CT;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  709  	return 0;
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  710  }
d78c317f6cd701 include/scsi/fc_encode.h       Neerav Parikh 2012-01-22  711  

:::::: The code at line 357 was first introduced by commit
:::::: d78c317f6cd701bda9f6dbfbfbcba72f39dd6ad7 [SCSI] libfc: Add support for FDMI

:::::: TO: Neerav Parikh <neerav.parikh@intel.com>
:::::: CC: James Bottomley <JBottomley@Parallels.com>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
