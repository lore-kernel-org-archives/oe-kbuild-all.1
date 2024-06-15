Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8D8994A11
	for <oe-kbuild-all@lists.linux.dev>; Sat, 15 Jun 2024 05:16:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1718428605; cv=none; b=VJm9DmzKA4D2LqorLSFerKyRNZVOmLNIPi1w68X/pZc1GTmk72dvVuOgtV/SAdr53lCTKIddW0DM+PCxo9vBMpjiISJsuBjgek8iJ+BwdQCVGHCvP8BVSxKS24zZV9gxF3R7g9ZY21MzfNBuq5xHcNYDjlVpQtDyoZl5BF9/Wrg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1718428605; c=relaxed/simple;
	bh=/lOhK9WsAtSgrRxO4G8bP+WBguFwgpLsyYi14Kq8wdg=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Ex6Q+D63A8aPnfJBVA7OWPnejWjHJ0x+AS7zjFt/qaNJHgNQTFRZNNKDMT3Z/BmXBkHytWQvyuP6AiGhBPW25CMgn9r/9mUqSqQEuefvcQZ/poIrCj0ocGOpOR+VdgtW6g9FJ4I2Moy1vqDlM3HCTSeB1X1eEg7V6xyJ6Lovnvc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=HXGWZ0bB; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="HXGWZ0bB"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1718428603; x=1749964603;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=/lOhK9WsAtSgrRxO4G8bP+WBguFwgpLsyYi14Kq8wdg=;
  b=HXGWZ0bBY4on9sBfjGfacz7ZgrcS8tXDXGypeC3EY+Bz94EZHN12P5KB
   F26qcb1sDTBgyWhYNRlOWWbXDlz/0NMHPTGtjbFeAiLDsI7obm44HpfSL
   vKSfwSQDVXO16xEpj22eSXGVWWV5PUqGkirHxuDB2VgYpKU2Uv5Tgzuni
   4h/yIztaK3/QWVxfBK0HHXwWb8NmByEIj2+g3a4m2vCD0jLPEiDc2hQ+v
   PSqlrgoWjO7P+AB5WiSVYstO6Fp1QF8lK2LPNZbIPyphIDyW23TkLJ89b
   IFNCg62kXNLqVKryClxCc0U6+Mk6eEIP9to6+R6xEtMkbPBPwdUt44R9F
   g==;
X-CSE-ConnectionGUID: cF7YmyxsQ36tZQUugWQTPw==
X-CSE-MsgGUID: YJDxw8M/QRC5C7Gt5LaZBA==
X-IronPort-AV: E=McAfee;i="6700,10204,11103"; a="15205399"
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="15205399"
Received: from fmviesa001.fm.intel.com ([10.60.135.141])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Jun 2024 22:16:42 -0700
X-CSE-ConnectionGUID: szl4a6BSROqFwDRbafol/Q==
X-CSE-MsgGUID: dAPdS9JNRfSpkDzs+V60UA==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.08,239,1712646000"; 
   d="scan'208";a="71911155"
Received: from lkp-server01.sh.intel.com (HELO 9e3ee4e9e062) ([10.239.97.150])
  by fmviesa001.fm.intel.com with ESMTP; 14 Jun 2024 22:16:41 -0700
Received: from kbuild by 9e3ee4e9e062 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1sILmJ-0002BY-2G;
	Sat, 15 Jun 2024 05:16:39 +0000
Date: Sat, 15 Jun 2024 13:16:19 +0800
From: kernel test robot <lkp@intel.com>
To: Andre Przywara <andre.przywara@arm.com>
Cc: oe-kbuild-all@lists.linux.dev, James Morse <james.morse@arm.com>
Subject: [morse:mpam/snapshot+extras/v6.10-rc1 117/127]
 drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted
 __le32
Message-ID: <202406151351.5MT3mrmy-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://git.kernel.org/pub/scm/linux/kernel/git/morse/linux.git mpam/snapshot+extras/v6.10-rc1
head:   928de66ad5fff2f15e2478fec40f5fbb4532314e
commit: 0330951cdf4c23129050d2dd380f8004ee20c44e [117/127] firmware: arm_scmi: add MPAM-FB SCMI protocol stub
config: csky-randconfig-r112-20240615 (https://download.01.org/0day-ci/archive/20240615/202406151351.5MT3mrmy-lkp@intel.com/config)
compiler: csky-linux-gcc (GCC) 13.2.0
reproduce: (https://download.01.org/0day-ci/archive/20240615/202406151351.5MT3mrmy-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202406151351.5MT3mrmy-lkp@intel.com/

sparse warnings: (new ones prefixed by >>)
>> drivers/firmware/arm_scmi/mpam.c:32:28: sparse: sparse: cast to restricted __le32
   drivers/firmware/arm_scmi/mpam.c: note: in included file (through include/linux/mmzone.h, include/linux/gfp.h, include/linux/xarray.h, ...):
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false
   include/linux/page-flags.h:240:46: sparse: sparse: self-comparison always evaluates to false

vim +32 drivers/firmware/arm_scmi/mpam.c

    12	
    13	static int scmi_mpam_transfer_buf(const struct scmi_protocol_handle *ph,
    14					  u8 msg_id, void *msg_buf, size_t msg_len,
    15					  u32 *ret_val)
    16	{
    17		int ret;
    18		struct scmi_xfer *t;
    19	
    20		ret = ph->xops->xfer_get_init(ph, msg_id, msg_len,
    21					      ret_val ? sizeof(*ret_val) : 0, &t);
    22		if (ret)
    23			return ret;
    24	
    25		memcpy(t->tx.buf, msg_buf, msg_len);
    26	
    27		ret = ph->xops->do_xfer(ph, t);
    28		if (!ret && ret_val) {
    29			u32 value;
    30	
    31			memcpy(&value, t->rx.buf, sizeof(value));
  > 32			*ret_val = le32_to_cpu(value);
    33		}
    34	
    35		ph->xops->xfer_put(ph, t);
    36	
    37		return ret;
    38	}
    39	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
