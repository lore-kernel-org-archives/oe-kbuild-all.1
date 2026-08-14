Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 782E545A28C
	for <oe-kbuild-all@lists.linux.dev>; Fri, 14 Aug 2026 12:58:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1786712326; cv=none; b=NV7GWg/OqpyJD8OHf2a9L78BiYlmj3Imul+P8fbzsghvVqLrMpDY3psfe/Qm7iE0RSJAmg3tU2ePjKxXI4VzEkasrzsFFEm+8dELbsFGT0XMJQqLWo/9iJdcp4yG+5bpjBifhN86UzB/52h2fsP1GrSXq1UkPkNKrKYLGrG6K5Q=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1786712326; c=relaxed/simple;
	bh=HsnDpRgeGQTwkUbPSgwqi8oqYYyf9H0LDhjaBqEAXVk=;
	h=Date:From:To:Cc:Subject:Message-ID; b=NVUwILjoAquUgVe9+XhWZwhrqyrS7+XymFR5Jrvi+bbDTOd2ichYjC7s2a0gOEwzAy1PYYGFRouxQtRwKavR7n7bGmpVTNfz+iec9pi42mr96AuMqsB54wEQxL2epqqlhU4QxZ1FdMKIyPszlXQCI8QRmVzVpuWPkZZhAAiGBZo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Obl7kqmx; arc=none smtp.client-ip=192.198.163.18
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Obl7kqmx"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1786712324; x=1818248324;
  h=date:from:to:cc:subject:message-id;
  bh=HsnDpRgeGQTwkUbPSgwqi8oqYYyf9H0LDhjaBqEAXVk=;
  b=Obl7kqmxWYD27yH1QwS08Dhv0kzG0tS6ZGlgdZZ03W71/vKszV4ktGCu
   QFNBmfH35bcFMjIqiz/QAUmrQBFJWnb8RnswUUev0S3vZ2WwTu6K1fXDK
   ouN7z0Z9OjTBn75YFNOB1aG/wjo2/THYO7vR1tMm6bDRV24j9DFg8tOmo
   So5d67odXEGNjUxx15u1sCnHjOb5qehbZQ6FEkzq7emEcE4vDBEBpnu9n
   BFjgjR6xBCBU7DkR7RC8cl+TTOwC5PTOYs74xOaqZutLpzPcXy9m/pnQH
   8ZKiPqFB8cZtjW7lVc6EZewEHurOO8qPkQyGrM3t/AxagLAjHOkeh5D+b
   g==;
X-CSE-ConnectionGUID: Nmr4Mkh3SSSK5lQBXETo7A==
X-CSE-MsgGUID: RoIeILjHTuubs5A4nmfkdw==
X-IronPort-AV: E=McAfee;i="6800,10657,11874"; a="86408625"
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="86408625"
Received: from orviesa006.jf.intel.com ([10.64.159.146])
  by fmvoesa112.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 14 Aug 2026 05:58:43 -0700
X-CSE-ConnectionGUID: ndiIMD5iR+qW+DC0664uCA==
X-CSE-MsgGUID: fKBdS10RQOOPrtE41lMzIQ==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.25,222,1779174000"; 
   d="scan'208";a="262461658"
Received: from igk-lkp-server01.igk.intel.com (HELO 3cba2a188a06) ([10.211.93.152])
  by orviesa006.jf.intel.com with ESMTP; 14 Aug 2026 05:58:42 -0700
Received: from kbuild by 3cba2a188a06 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wurUd-000000006Fl-0Kc4;
	Fri, 14 Aug 2026 12:58:39 +0000
Date: Fri, 14 Aug 2026 14:57:51 +0200
From: kernel test robot <lkp@intel.com>
To: Louis Chauvet <louis.chauvet@bootlin.com>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/gpu/drm/vkms/vkms_configfs.c:625:5: warning:
 'vkms_configfs_parse_next_format' defined but not used
Message-ID: <202608141459.lTWy7nlR-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Louis-Chauvet/drm-drm_mode_config-Add-helper-to-get-plane-type-name/20260807-092508
head:   c4c09a7274b7bb12e10957fc5da78e52e5bbf54d
commit: d799e044e269193685079d3260b0b0b33d17a237 drm/vkms: Introduce configfs for plane format
date:   7 days ago
config: x86_64-rhel-9.4-bpf (https://download.01.org/0day-ci/archive/20260814/202608141459.lTWy7nlR-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260814/202608141459.lTWy7nlR-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202608141459.lTWy7nlR-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/gpu/drm/vkms/vkms_configfs.c:625:5: warning: 'vkms_configfs_parse_next_format' defined but not used [-Wunused-function]
     625 | int vkms_configfs_parse_next_format(const char *page, const char *page_end, char **out)
         |     ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~


vim +/vkms_configfs_parse_next_format +625 drivers/gpu/drm/vkms/vkms_configfs.c

   614	
   615	/**
   616	 * vkms_configfs_parse_next_format() - Parse the next format in page,
   617	 *				       skipping all non fourcc-related characters
   618	 * @page: page to search into
   619	 * @page_end: last character of the page
   620	 * @out: Output pointer, will point inside page
   621	 *
   622	 * Returns: size of the matched format, @out will point to the + or -
   623	 */
   624	VISIBLE_IF_KUNIT
 > 625	int vkms_configfs_parse_next_format(const char *page, const char *page_end, char **out)
   626	{
   627		int count = page - page_end;
   628		char *tmp_plus = strnchr(page, count, '+');
   629		char *tmp_minus = strnchr(page, count, '-');
   630	
   631		if (!tmp_plus && !tmp_minus)
   632			return 0;
   633		if (!tmp_plus)
   634			*out = tmp_minus;
   635		else if (!tmp_minus)
   636			*out = tmp_plus;
   637		else
   638			*out = min(tmp_plus, tmp_minus);
   639	
   640		char *end = *out + 1;
   641	
   642		while (end < page_end) {
   643			if (!isalnum(*end) && *end != '*')
   644				break;
   645			end++;
   646		}
   647	
   648		return end - *out;
   649	}
   650	EXPORT_SYMBOL_IF_KUNIT(vkms_configfs_parse_next_format);
   651	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
