Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 391BB16CD33
	for <oe-kbuild-all@lists.linux.dev>; Sat,  2 May 2026 17:35:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1777743309; cv=none; b=g5VAMbMy2fZWIiuLkbD8VfjR5kkUuNVxQ1pz2Ib7H3G8+3wQACzPGOfUtw8uMrIiNB0oj1i5aIPldk2Eq9DGF0P6PfmDUzXvIT+nqGZJoNMXZt0XYyzK289CshmOIIdXqPFsJ+v9ACREDFALIuAjIzle7NKUjnAt6cRRiCvcaY8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1777743309; c=relaxed/simple;
	bh=8I81VJ0WSZ9XNZBcFV1kgKX0kDVzxLwiCAHe2dPWURA=;
	h=Date:From:To:Cc:Subject:Message-ID; b=fheiE77RVh05xdKsalRYwN4BMTktt5yz2dQvyEPcRWJkRzjREp9BXsf1ZTMe2YGYvnODxBnbQkd2+nKyukiDf2TYAq8aTKjN6KmT0vD0kqK+6qY/MhaqIWGtysK5qmsicv4RsC+8yMiiGT8RgDrbchObVZDEGPefsIRsAktePso=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=d+xZcYUe; arc=none smtp.client-ip=198.175.65.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="d+xZcYUe"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1777743307; x=1809279307;
  h=date:from:to:cc:subject:message-id;
  bh=8I81VJ0WSZ9XNZBcFV1kgKX0kDVzxLwiCAHe2dPWURA=;
  b=d+xZcYUebU2zYfsFSsKKx0QVFNHpZML9i9iOXye0QlYPARElryTg97lA
   ZxrQcPWX871PSjc4EqTpm1qhAmRCUB0Z6vyhfd2BXRRBzQvhI8V4yKnEX
   vfOBnl2cGMo9cHAt1smj7cNHDLSA3oYUWmRPdnLOBj+8QrExGtbRjmrxs
   Ug61QwToZg2BFtwcOsJCV3KLdj362+rK7mf9G4bQFCvatk6ODwwThhv/B
   s/DmX8ToyJC8gASiVe1unhR3ngsU1ghMGhnV3MDnAU7Oi7GQJ4WUJAfxL
   GN/l5loURwFwSOkxSN9yAQ9SPE4DeOix1C8oPHZcZP9mcQSK1ZUc3do3l
   Q==;
X-CSE-ConnectionGUID: R7dafqdJQ8qD10R8SgF9kA==
X-CSE-MsgGUID: eIAWcB4+QSiqjN33LfHRRQ==
X-IronPort-AV: E=McAfee;i="6800,10657,11774"; a="78662531"
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="78662531"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa109.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 02 May 2026 10:35:07 -0700
X-CSE-ConnectionGUID: d9V+94s+SmSITyv9uSiCsw==
X-CSE-MsgGUID: ACVkmpAoQJq0p84CEuGe0A==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.23,212,1770624000"; 
   d="scan'208";a="230769722"
Received: from igk-lkp-server01.igk.intel.com (HELO bdf09bfdbd5f) ([10.211.93.152])
  by fmviesa010.fm.intel.com with ESMTP; 02 May 2026 10:35:05 -0700
Received: from kbuild by bdf09bfdbd5f with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wJEF4-000000005JR-45dG;
	Sat, 02 May 2026 17:35:02 +0000
Date: Sat, 02 May 2026 19:34:21 +0200
From: kernel test robot <lkp@intel.com>
To: "Tycho Andersen (AMD)" <tycho@kernel.org>
Cc: oe-kbuild-all@lists.linux.dev, 0day robot <lkp@intel.com>
Subject: drivers/crypto/ccp/sev-dev.c:2165:17: warning: variable
 'error' set but not used
Message-ID: <202605021948.Ev9XGd7i-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>

tree:   https://github.com/intel-lab-lkp/linux/commits/Tycho-Andersen/crypto-ccp-Hoist-kernel-part-of-SNP_PLATFORM_STATUS/20260502-181408
head:   61b6850d2a4e7abc1dc7b500a6786191f7fad8d3
commit: 61b6850d2a4e7abc1dc7b500a6786191f7fad8d3 crypto/ccp: Implement SNP firmware live update
date:   7 hours ago
config: x86_64-rhel-9.4 (https://download.01.org/0day-ci/archive/20260502/202605021948.Ev9XGd7i-lkp@intel.com/config)
compiler: gcc-14 (Debian 14.2.0-19) 14.2.0
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260502/202605021948.Ev9XGd7i-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605021948.Ev9XGd7i-lkp@intel.com/

All warnings (new ones prefixed by >>):

   drivers/crypto/ccp/sev-dev.c: In function 'sev_fw_upload_write':
>> drivers/crypto/ccp/sev-dev.c:2165:17: warning: variable 'error' set but not used [-Wunused-but-set-variable]
    2165 |         int rc, error = 0;
         |                 ^~~~~


vim +/error +2165 drivers/crypto/ccp/sev-dev.c

  2158	
  2159	static enum fw_upload_err sev_fw_upload_write(struct fw_upload *fw_upload,
  2160						      const u8 *data, u32 offset,
  2161						      u32 size, u32 *written)
  2162	{
  2163		struct sev_device *sev = fw_upload->dd_handle;
  2164		u8 old_major, old_minor, old_build;
> 2165		int rc, error = 0;
  2166		enum fw_upload_err ret;
  2167	
  2168		if (offset != 0)
  2169			return FW_UPLOAD_ERR_INVALID_SIZE;
  2170	
  2171		old_major = sev->api_major;
  2172		old_minor = sev->api_minor;
  2173		old_build = sev->build;
  2174	
  2175		mutex_lock(&sev_cmd_mutex);
  2176	
  2177		/*
  2178		 * If the last firmware update returned RESTORE_REQUIRED, allow only
  2179		 * this DLFWEX command so the admin can restore the previous FW
  2180		 * version. If we are in this state the legacy firmware has previously
  2181		 * been shut down, so no need to do it again.
  2182		 */
  2183		if (dlfwex_wants_rollback && psp_dead) {
  2184			dlfwex_wants_rollback = false;
  2185			psp_dead = false;
  2186		} else {
  2187			rc = sev_firmware_shutdown_if_sev_initialized(sev);
  2188			if (rc) {
  2189				ret = FW_UPLOAD_ERR_BUSY;
  2190				goto unlock;
  2191			}
  2192		}
  2193	
  2194		rc = sev_download_firmware_ex(sev, data, size);
  2195		if (rc) {
  2196			ret = FW_UPLOAD_ERR_FW_INVALID;
  2197			switch (rc) {
  2198			case SEV_RET_INVALID_PLATFORM_STATE:
  2199				fallthrough;
  2200			case SEV_RET_INVALID_ADDRESS:
  2201				/* these are probably kernel bugs */
  2202				WARN_ON_ONCE(true);
  2203				ret = FW_UPLOAD_ERR_BUSY;
  2204				goto unlock;
  2205			case SEV_RET_INVALID_LEN:
  2206				ret = FW_UPLOAD_ERR_INVALID_SIZE;
  2207				goto unlock;
  2208			case SEV_RET_INVALID_PARAM:
  2209				dev_err(sev->dev, "SEV firmware image is not well formed\n");
  2210				goto unlock;
  2211			case SEV_RET_SHUTDOWN_REQUIRED:
  2212				dev_err(sev->dev, "SEV firmware too far, shutdown required\n");
  2213				goto unlock;
  2214			case SEV_RET_INVALID_CONFIG:
  2215				dev_err(sev->dev, "SEV firmware upgrade would rollback SVN\n");
  2216				goto unlock;
  2217			case SEV_RET_BAD_SIGNATURE:
  2218				dev_err(sev->dev, "SEV firmware upgrade bad signature\n");
  2219				goto unlock;
  2220			case SEV_RET_BAD_VERSION:
  2221				dev_err(sev->dev, "SEV firmware upgrade less than CommittedVersion\n");
  2222				goto unlock;
  2223			case SEV_RET_UNSUPPORTED:
  2224				dev_err(sev->dev, "SEV firmware required feature not supported\n");
  2225				goto unlock;
  2226			case SEV_RET_UPDATE_FAILED:
  2227				/*
  2228				 * Update failed but fw rolled back on its own,
  2229				 * operation can continue normally.
  2230				 */
  2231				dev_err(sev->dev, "SEV firmware update failed\n");
  2232				ret = FW_UPLOAD_ERR_HW_ERROR;
  2233				goto unlock;
  2234			case SEV_RET_HWSEV_RET_UNSAFE:
  2235				/*
  2236				 * "Following a return of HARDWARE_UNSAFE, operation of
  2237				 * the SEV firmware is indeterminate
  2238				 * and the recommendation is to reboot the platform."
  2239				 */
  2240				dev_err(sev->dev, "SEV firmware no longer safe to operate\n");
  2241				psp_dead = true;
  2242				ret = FW_UPLOAD_ERR_HW_ERROR;
  2243				goto unlock;
  2244			case SEV_RET_RESTORE_REQUIRED:
  2245				/*
  2246				 * FW asked us to roll back; we don't hold onto the
  2247				 * last FW image, so we can't. We can set a flag to
  2248				 * allow the admin to rollback if they happen to have
  2249				 * the old firmware image handy.
  2250				 */
  2251				dev_err(sev->dev, "SEV firmware update failed, please roll back\n");
  2252				psp_dead = true;
  2253				dlfwex_wants_rollback = true;
  2254				ret = FW_UPLOAD_ERR_HW_ERROR;
  2255				goto unlock;
  2256			default:
  2257				dev_err(sev->dev, "Unknown SEV firmware err %d\n", rc);
  2258				ret = FW_UPLOAD_ERR_HW_ERROR;
  2259				goto unlock;
  2260			}
  2261		}
  2262	
  2263		*written = size;
  2264		ret = FW_UPLOAD_ERR_NONE;
  2265	
  2266	unlock:
  2267		mutex_unlock(&sev_cmd_mutex);
  2268	
  2269		/*
  2270		 * sev_get_api_version() updates the SEV and SNP statuses, SNP feature
  2271		 * info if available, build numbers, etc. cached in struct sev_device.
  2272		 * Update these if they may have changed for new firmware.
  2273		 */
  2274		if (ret == FW_UPLOAD_ERR_NONE) {
  2275			error = 0;
  2276	
  2277			rc = sev_get_api_version();
  2278			if (rc) {
  2279				dev_warn(sev->dev,
  2280					 "SNP platform data refresh after firmware update failed %d\n",
  2281					 rc);
  2282			} else if (sev->api_major != old_major ||
  2283				   sev->api_minor != old_minor ||
  2284				   sev->build != old_build) {
  2285				dev_info(sev->dev, "SEV firmware updated to %d.%d build %d\n",
  2286					 sev->api_major, sev->api_minor, sev->build);
  2287			} else {
  2288				dev_info(sev->dev, "SEV firmware not updated\n");
  2289			}
  2290		}
  2291	
  2292		if (!dlfwex_wants_rollback)
  2293			sev_firmware_reinit_if_shutdown(sev);
  2294	
  2295		return ret;
  2296	}
  2297	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
