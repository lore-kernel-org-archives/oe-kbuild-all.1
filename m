Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.12])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2FE18142E8C
	for <oe-kbuild-all@lists.linux.dev>; Thu,  4 Jul 2024 22:57:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.12
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1720133839; cv=none; b=gYXSQ2ZKz8IP9iFCf++j1FX8gFWHgdNr3LAobV0Qtua7qyJAAUSVaFsQMiySIooJIh0dZhyyzZ9mqxZPnuZg8jqjtNcAejwVr17ZX6QmO3URtZKvnWHHuChpa5i+7dAGsNoTAwjFz3GAvHR49CP/LLvI8KobrFOL3RH/EWCEKrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1720133839; c=relaxed/simple;
	bh=sAO8SiMv4s5iYvbKHY9MtsunIj65IcAZQwm64LV2fw4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=B4HdA4+Dc+7wgCoiHO5MPALYux65STxR0HCix7ks0kRqoytSpUmxL6MHqA4kLctm2xB9zKHuXKLsCyRPZOj4CY/hnx18lNLBaZYZP38CHPfEt8jUQZfob6xQN9J+EHWcs7JYQOhlvhqHbnjBYXGLwDC4OOiLiuRACbZihZc5Fhk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Dy4PWBsq; arc=none smtp.client-ip=198.175.65.12
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Dy4PWBsq"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1720133837; x=1751669837;
  h=date:from:to:cc:subject:message-id:mime-version:
   content-transfer-encoding;
  bh=sAO8SiMv4s5iYvbKHY9MtsunIj65IcAZQwm64LV2fw4=;
  b=Dy4PWBsqPvjmCI+6/pTpjYhDEtmFPagXRJrlWxxtSzvRJIm8/vLWHmi3
   wuulnFZ2mqIwu7B92NHkPNXaHSp3efpK354b6zqHuFsF286znBIXaZjbN
   y4O6vEEhfCPJhEEqNqbDRfPhppPD1svtnvtWOJ7RYuC57iRF104M7mT0/
   7D0jdzl8jGf25QenJZ9sgYJfIK13OPnZY7I8g7zy7BMdDv14keckC1QF1
   REZXq/U72sahghGJ+pX5vVwv4NEq3MJ55GmsXEhPkT4OvLTflAsOSKMWw
   nOR25e1wX++QuZTWrZKNLqTbCgcKl3TKEMHV34uZnkxEykZTgh7O74GrS
   g==;
X-CSE-ConnectionGUID: yhDCuW20SvWkP1BKN305JA==
X-CSE-MsgGUID: 4x3nnghoS06YffP6ayHZ+A==
X-IronPort-AV: E=McAfee;i="6700,10204,11123"; a="28818434"
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="28818434"
Received: from fmviesa005.fm.intel.com ([10.60.135.145])
  by orvoesa104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Jul 2024 15:57:17 -0700
X-CSE-ConnectionGUID: uaPdMtv/SC+G2Z9e5G7Z6Q==
X-CSE-MsgGUID: pfZjh9H4SpSobgi6MW9qpg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.09,183,1716274800"; 
   d="scan'208";a="51140124"
Received: from lkp-server01.sh.intel.com (HELO 68891e0c336b) ([10.239.97.150])
  by fmviesa005.fm.intel.com with ESMTP; 04 Jul 2024 15:57:15 -0700
Received: from kbuild by 68891e0c336b with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sPVO5-000RbN-06;
	Thu, 04 Jul 2024 22:57:13 +0000
Date: Fri, 5 Jul 2024 06:57:02 +0800
From: kernel test robot <lkp@intel.com>
To: Takashi Sakamoto <o-takashi@sakamocchi.jp>
Cc: oe-kbuild-all@lists.linux.dev, linux1394-devel@lists.sourceforge.net
Subject: [ieee1394-linux1394:for-next 26/30] drivers/firewire/ohci.c:891:23:
 sparse: sparse: cast to restricted __be32
Message-ID: <202407050656.03bw1YXA-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/ieee1394/linux1394.git for-next
head:   526e21a2aa6fa7ac3309a8c87f4d6e5f7e407cb6
commit: f26a38e61c03fdfacb6b596e1daf665cf4526a60 [26/30] firewire: ohci: use common macro to interpret be32 data in le32 buffer
config: powerpc-randconfig-r122-20240704 (https://download.01.org/0day-ci/archive/20240705/202407050656.03bw1YXA-lkp@intel.com/config)
compiler: powerpc-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240705/202407050656.03bw1YXA-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202407050656.03bw1YXA-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firewire/ohci.c:891:23: sparse: sparse: cast to restricted __be32
>> drivers/firewire/ohci.c:891:23: sparse: sparse: cast from restricted __le32
   drivers/firewire/ohci.c:892:23: sparse: sparse: cast to restricted __be32
   drivers/firewire/ohci.c:892:23: sparse: sparse: cast from restricted __le32
   drivers/firewire/ohci.c:893:23: sparse: sparse: cast to restricted __be32
   drivers/firewire/ohci.c:893:23: sparse: sparse: cast from restricted __le32
   drivers/firewire/ohci.c:905:31: sparse: sparse: cast to restricted __be32
   drivers/firewire/ohci.c:905:31: sparse: sparse: cast from restricted __le32
   drivers/firewire/ohci.c:914:31: sparse: sparse: cast to restricted __be32
   drivers/firewire/ohci.c:914:31: sparse: sparse: cast from restricted __le32
   drivers/firewire/ohci.c:939:18: sparse: sparse: cast to restricted __be32
   drivers/firewire/ohci.c:939:18: sparse: sparse: cast from restricted __le32
   drivers/firewire/ohci.c:2033:23: sparse: sparse: cast to restricted __be32
   drivers/firewire/ohci.c:2033:23: sparse: sparse: cast from restricted __le32
   drivers/firewire/ohci.c:2037:27: sparse: sparse: cast to restricted __be32
   drivers/firewire/ohci.c:2037:27: sparse: sparse: cast from restricted __le32
   drivers/firewire/ohci.c:2038:27: sparse: sparse: cast to restricted __be32
   drivers/firewire/ohci.c:2038:27: sparse: sparse: cast from restricted __le32

vim +891 drivers/firewire/ohci.c

11bf20ad028880 drivers/firewire/fw-ohci.c Stefan Richter    2008-03-01  883  
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  884  static __le32 *handle_ar_packet(struct ar_context *ctx, __le32 *buffer)
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  885  {
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  886  	struct fw_ohci *ohci = ctx->ohci;
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  887  	struct fw_packet p;
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  888  	u32 status, length, tcode;
43286568adb3cc drivers/firewire/fw-ohci.c Stefan Richter    2008-03-11  889  	int evt;
0edeefd99fd31f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  890  
11bf20ad028880 drivers/firewire/fw-ohci.c Stefan Richter    2008-03-01 @891  	p.header[0] = cond_le32_to_cpu(buffer[0]);
11bf20ad028880 drivers/firewire/fw-ohci.c Stefan Richter    2008-03-01  892  	p.header[1] = cond_le32_to_cpu(buffer[1]);
11bf20ad028880 drivers/firewire/fw-ohci.c Stefan Richter    2008-03-01  893  	p.header[2] = cond_le32_to_cpu(buffer[2]);
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  894  
4af43614186815 drivers/firewire/ohci.c    Takashi Sakamoto  2024-04-28  895  	tcode = async_header_get_tcode(p.header);
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  896  	switch (tcode) {
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  897  	case TCODE_WRITE_QUADLET_REQUEST:
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  898  	case TCODE_READ_QUADLET_RESPONSE:
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  899  		p.header[3] = (__force __u32) buffer[3];
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  900  		p.header_length = 16;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  901  		p.payload_length = 0;
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  902  		break;
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  903  
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  904  	case TCODE_READ_BLOCK_REQUEST :
11bf20ad028880 drivers/firewire/fw-ohci.c Stefan Richter    2008-03-01  905  		p.header[3] = cond_le32_to_cpu(buffer[3]);
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  906  		p.header_length = 16;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  907  		p.payload_length = 0;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  908  		break;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  909  
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  910  	case TCODE_WRITE_BLOCK_REQUEST:
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  911  	case TCODE_READ_BLOCK_RESPONSE:
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  912  	case TCODE_LOCK_REQUEST:
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  913  	case TCODE_LOCK_RESPONSE:
11bf20ad028880 drivers/firewire/fw-ohci.c Stefan Richter    2008-03-01  914  		p.header[3] = cond_le32_to_cpu(buffer[3]);
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  915  		p.header_length = 16;
4af43614186815 drivers/firewire/ohci.c    Takashi Sakamoto  2024-04-28  916  		p.payload_length = async_header_get_data_length(p.header);
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  917  		if (p.payload_length > MAX_ASYNC_PAYLOAD) {
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  918  			ar_context_abort(ctx, "invalid packet length");
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  919  			return NULL;
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  920  		}
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  921  		break;
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  922  
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  923  	case TCODE_WRITE_RESPONSE:
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  924  	case TCODE_READ_QUADLET_REQUEST:
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  925  	case OHCI_TCODE_PHY_PACKET:
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  926  		p.header_length = 12;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  927  		p.payload_length = 0;
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  928  		break;
ccff962943df53 drivers/firewire/fw-ohci.c Stefan Richter    2008-05-31  929  
ccff962943df53 drivers/firewire/fw-ohci.c Stefan Richter    2008-05-31  930  	default:
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  931  		ar_context_abort(ctx, "invalid tcode");
7a39d8b8216546 drivers/firewire/ohci.c    Clemens Ladisch   2010-11-26  932  		return NULL;
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  933  	}
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  934  
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  935  	p.payload = (void *) buffer + p.header_length;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  936  
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  937  	/* FIXME: What to do about evt_* errors? */
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  938  	length = (p.header_length + p.payload_length + 3) / 4;
11bf20ad028880 drivers/firewire/fw-ohci.c Stefan Richter    2008-03-01  939  	status = cond_le32_to_cpu(buffer[length]);
43286568adb3cc drivers/firewire/fw-ohci.c Stefan Richter    2008-03-11  940  	evt    = (status >> 16) & 0x1f;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  941  
43286568adb3cc drivers/firewire/fw-ohci.c Stefan Richter    2008-03-11  942  	p.ack        = evt - 16;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  943  	p.speed      = (status >> 21) & 0x7;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  944  	p.timestamp  = status & 0xffff;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  945  	p.generation = ohci->request_generation;
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  946  
64d2172019dcfe drivers/firewire/ohci.c    Stefan Richter    2011-12-20  947  	log_ar_at_event(ohci, 'R', p.speed, p.header, evt);
ad3c0fe8b8d165 drivers/firewire/fw-ohci.c Stefan Richter    2008-03-20  948  
c781c06d119d04 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-05-07  949  	/*
a4dc090b6cb445 drivers/firewire/ohci.c    Stefan Richter    2010-08-28  950  	 * Several controllers, notably from NEC and VIA, forget to
a4dc090b6cb445 drivers/firewire/ohci.c    Stefan Richter    2010-08-28  951  	 * write ack_complete status at PHY packet reception.
a4dc090b6cb445 drivers/firewire/ohci.c    Stefan Richter    2010-08-28  952  	 */
4af43614186815 drivers/firewire/ohci.c    Takashi Sakamoto  2024-04-28  953  	if (evt == OHCI1394_evt_no_status && tcode == OHCI1394_phy_tcode)
a4dc090b6cb445 drivers/firewire/ohci.c    Stefan Richter    2010-08-28  954  		p.ack = ACK_COMPLETE;
a4dc090b6cb445 drivers/firewire/ohci.c    Stefan Richter    2010-08-28  955  
a4dc090b6cb445 drivers/firewire/ohci.c    Stefan Richter    2010-08-28  956  	/*
a4dc090b6cb445 drivers/firewire/ohci.c    Stefan Richter    2010-08-28  957  	 * The OHCI bus reset handler synthesizes a PHY packet with
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  958  	 * the new generation number when a bus reset happens (see
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  959  	 * section 8.4.2.3).  This helps us determine when a request
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  960  	 * was received and make sure we send the response in the same
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  961  	 * generation.  We only need this for requests; for responses
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  962  	 * we use the unique tlabel for finding the matching
c781c06d119d04 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-05-07  963  	 * request.
d34316a4bdcd4f drivers/firewire/fw-ohci.c Stefan Richter    2008-04-12  964  	 *
d34316a4bdcd4f drivers/firewire/fw-ohci.c Stefan Richter    2008-04-12  965  	 * Alas some chips sometimes emit bus reset packets with a
d34316a4bdcd4f drivers/firewire/fw-ohci.c Stefan Richter    2008-04-12  966  	 * wrong generation.  We set the correct generation for these
2d7a36e23300d2 drivers/firewire/ohci.c    Stephan Gatzka    2011-07-25  967  	 * at a slightly incorrect time (in bus_reset_work).
c781c06d119d04 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-05-07  968  	 */
d34316a4bdcd4f drivers/firewire/fw-ohci.c Stefan Richter    2008-04-12  969  	if (evt == OHCI1394_evt_bus_reset) {
4a635593f44744 drivers/firewire/ohci.c    Stefan Richter    2010-02-21  970  		if (!(ohci->quirks & QUIRK_RESET_PACKET))
25df287dc7434e drivers/firewire/fw-ohci.c Stefan Richter    2008-02-23  971  			ohci->request_generation = (p.header[2] >> 16) & 0xff;
d34316a4bdcd4f drivers/firewire/fw-ohci.c Stefan Richter    2008-04-12  972  	} else if (ctx == &ohci->ar_request_ctx) {
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  973  		fw_core_handle_request(&ohci->card, &p);
d34316a4bdcd4f drivers/firewire/fw-ohci.c Stefan Richter    2008-04-12  974  	} else {
2639a6fb268e1f drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-01-26  975  		fw_core_handle_response(&ohci->card, &p);
d34316a4bdcd4f drivers/firewire/fw-ohci.c Stefan Richter    2008-04-12  976  	}
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  977  
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  978  	return buffer + length + 1;
32b46093a07698 drivers/firewire/fw-ohci.c Kristian Høgsberg 2007-02-06  979  }
ed5689122f4cdb drivers/firewire/fw-ohci.c Kristian Høgsberg 2006-12-19  980  

:::::: The code at line 891 was first introduced by commit
:::::: 11bf20ad028880a56689f086bfbabfd88b2af38b firewire: fw-ohci: Apple UniNorth 1st generation support

:::::: TO: Stefan Richter <stefanr@s5r6.in-berlin.de>
:::::: CC: Stefan Richter <stefanr@s5r6.in-berlin.de>

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
