Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CEE77224B1E
	for <oe-kbuild-all@lists.linux.dev>; Wed, 29 Oct 2025 23:38:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.16
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761781097; cv=none; b=ISbyhKglKO/eO456VzMKF8BTkJS8KpmkuwLKLMIhdFzASlNdJCcz/P6nFCFN9u9Z/4vnivW3Ersur+tTMeatroHe4N8T/D7LsaYSI8eg9UZeaLoW0apblwppgl6x1wkans6MqxDiOCJPljCNvU69HCcpekb9uW1UaOaupKNA/TY=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761781097; c=relaxed/simple;
	bh=9lw1ueNHFPR0lQZ65TLPjoOJkTTPGQ5FXwU6wqvRypw=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Q9zsq7U5SvbRcfKdJze19xQCkosNmpduICWPDP5uXLkxxsnduExwZ2vikkJqp2L69Bm+1tE6NEU8oY/+HM+B/0SovXEoQuleuJrSOndvHcbEsCxvXidWJY1b5L14J/KlEn9o+zUXNwPcT6n3eegVrmkrrZVgJFGl/QUUmmVLNsc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=MxyRet6J; arc=none smtp.client-ip=192.198.163.16
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="MxyRet6J"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1761781096; x=1793317096;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=9lw1ueNHFPR0lQZ65TLPjoOJkTTPGQ5FXwU6wqvRypw=;
  b=MxyRet6JfsnuskpiQnECpfgafMYTvM/950O6UJHVBLYNl//aiqSbqlve
   Tw63EIe5jFbdS/leWnbyDbHoxUzCa4/dSsQAfMPvVHDL+TOW1sGoHhE2P
   SP2Y0z/Ms7gTvNeaoWx5ShWuCJCmwZZWvBlNN1bp+LDgkxMdaFPPcKMoV
   A2fj7ajmnfRFBTF3vWrAvaOg7Nm3m/lSmYybr3myZLUwPdexButuHlwao
   oLGOdGkkDNHcCfStfyS5eYiAqgGws4jmJS67VfAxUPqQIGaup5E6UUKPq
   OQxgAQhPJ/p8FGeu1nt4B8TdQuwSayUJSIjPPogrptPnTzh5xnnF6xPG2
   A==;
X-CSE-ConnectionGUID: 0tCZr0AvRZKihNo8J6WYTQ==
X-CSE-MsgGUID: yiZM/oJBTzigCDEArHjGzA==
X-IronPort-AV: E=McAfee;i="6800,10657,11597"; a="51487841"
X-IronPort-AV: E=Sophos;i="6.19,265,1754982000"; 
   d="scan'208";a="51487841"
Received: from fmviesa003.fm.intel.com ([10.60.135.143])
  by fmvoesa110.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 29 Oct 2025 16:38:13 -0700
X-CSE-ConnectionGUID: G3oZviuzRdylUdmsz0VvXw==
X-CSE-MsgGUID: p6+G1YqARXWx5GARi8IRKQ==
X-ExtLoop1: 1
Received: from lkp-server02.sh.intel.com (HELO 66d7546c76b2) ([10.239.97.151])
  by fmviesa003.fm.intel.com with ESMTP; 29 Oct 2025 16:38:12 -0700
Received: from kbuild by 66d7546c76b2 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1vEFk1-000LHE-37;
	Wed, 29 Oct 2025 23:38:09 +0000
Date: Thu, 30 Oct 2025 07:37:17 +0800
From: kernel test robot <lkp@intel.com>
To: Marek Vasut <marek.vasut+renesas@mailbox.org>
Cc: oe-kbuild-all@lists.linux.dev,
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Subject: [morimoto:renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide 17/21]
 drivers/firmware/arm_scmi/clock.c:372 scmi_clock_attributes_get() warn:
 inconsistent indenting
Message-ID: <202510300713.kEzAOMob-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/morimoto/linux renesas-lts/v6.18-rc2-2025-10-24-x5h-ironhide
head:   fe21d488fba0b6bcb0416fab7cf246e35592ce10
commit: a41fb521b7890741915df9db4eae9e134ba0f28a [17/21] FIXME: firmware: arm_scmi: Print shortname-to-ID mapping
config: um-randconfig-r073-20251025 (https://download.01.org/0day-ci/archive/20251030/202510300713.kEzAOMob-lkp@intel.com/config)
compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project e1ae12640102fd2b05bc567243580f90acb1135f)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202510300713.kEzAOMob-lkp@intel.com/

smatch warnings:
drivers/firmware/arm_scmi/clock.c:372 scmi_clock_attributes_get() warn: inconsistent indenting

vim +372 drivers/firmware/arm_scmi/clock.c

   347	
   348	static int scmi_clock_attributes_get(const struct scmi_protocol_handle *ph,
   349					     u32 clk_id, struct clock_info *cinfo,
   350					     u32 version)
   351	{
   352		int ret;
   353		u32 attributes;
   354		struct scmi_xfer *t;
   355		struct scmi_msg_resp_clock_attributes *attr;
   356		struct scmi_clock_info *clk = cinfo->clk + clk_id;
   357	
   358		ret = ph->xops->xfer_get_init(ph, CLOCK_ATTRIBUTES,
   359					      sizeof(clk_id), sizeof(*attr), &t);
   360		if (ret)
   361			return ret;
   362	
   363		put_unaligned_le32(clk_id, t->tx.buf);
   364		attr = t->rx.buf;
   365	
   366		ret = ph->xops->do_xfer(ph, t);
   367		if (!ret) {
   368			u32 latency = 0;
   369	
   370			attributes = le32_to_cpu(attr->attributes);
   371			strscpy(clk->name, attr->name, SCMI_SHORT_NAME_MAX_SIZE);
 > 372	dev_err(ph->dev, "%s[%d]<%d =name %s>\n", __func__, __LINE__, clk_id, clk->name);
   373			/* clock_enable_latency field is present only since SCMI v3.1 */
   374			if (PROTOCOL_REV_MAJOR(version) >= 0x2)
   375				latency = le32_to_cpu(attr->clock_enable_latency);
   376			clk->enable_latency = latency ? : U32_MAX;
   377		}
   378	
   379		ph->xops->xfer_put(ph, t);
   380	
   381		/*
   382		 * If supported overwrite short name with the extended one;
   383		 * on error just carry on and use already provided short name.
   384		 */
   385		if (!ret && PROTOCOL_REV_MAJOR(version) >= 0x2) {
   386			if (SUPPORTS_EXTENDED_NAMES(attributes))
   387				ph->hops->extended_name_get(ph, CLOCK_NAME_GET, clk_id,
   388							    NULL, clk->name,
   389							    SCMI_MAX_STR_SIZE);
   390	
   391			if (cinfo->notify_rate_changed_cmd &&
   392			    SUPPORTS_RATE_CHANGED_NOTIF(attributes))
   393				clk->rate_changed_notifications = true;
   394			if (cinfo->notify_rate_change_requested_cmd &&
   395			    SUPPORTS_RATE_CHANGE_REQUESTED_NOTIF(attributes))
   396				clk->rate_change_requested_notifications = true;
   397			if (PROTOCOL_REV_MAJOR(version) >= 0x3) {
   398				if (SUPPORTS_PARENT_CLOCK(attributes))
   399					scmi_clock_possible_parents(ph, clk_id, clk);
   400				if (SUPPORTS_GET_PERMISSIONS(attributes))
   401					scmi_clock_get_permissions(ph, clk_id, clk);
   402				if (SUPPORTS_EXTENDED_CONFIG(attributes))
   403					clk->extended_config = true;
   404			}
   405		}
   406	
   407		return ret;
   408	}
   409	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
