Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61225204C3A
	for <oe-kbuild-all@lists.linux.dev>; Wed, 19 Mar 2025 21:06:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742418382; cv=none; b=RsrtzcViUjVCPNrR3D+f4FD+tcAB6vioPz8snx+7JPUprmWi1M7hf9lOmXzF8DUot9+7j3exb3QR7grHcleveEHoApC7X7jG+l5xcEeiGU86fTkGZJkBI7NOl9KdfiwyXzW1mS7znsu7M7G3JyZ0nLcN+N71auIClSAAOrLMYho=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742418382; c=relaxed/simple;
	bh=SammaTTHmlfNrhPhfdawlNTCOt/ewpCunjN7+1o+yy4=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=Wz2cDatJzdxnBHorzoZrd63B8XZYdWlVtWq4xj0vJCwiTujA1b4gJIMyp1e7VbZEK/0hseysYokInFSltGxMcIkmI9YsgIn9VyMPb034X/8UBtOLuE7US7j7QsO0E8Sq+mL+0RWAv6Rsf7EhVmpnMrEMc/0AfkQnOvo2JzyBJ7Y=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=Kq3F6/0H; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="Kq3F6/0H"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1742418380; x=1773954380;
  h=date:from:to:cc:subject:message-id:mime-version;
  bh=SammaTTHmlfNrhPhfdawlNTCOt/ewpCunjN7+1o+yy4=;
  b=Kq3F6/0HJ5fsTZsaiz7SCOv7KSdum0v/DJaOVPWm/3d7ehiYDuBsmh7n
   z9Q+v+X1IrYrpX4amcJXk1hTxbOyAxqaWk8KChNCVMKeusPgWyWYfiLWY
   ZSejZLkAVjpajsoLof+MxtfuInNpdYH0GvAfO4RfPlGd+MGVUPpQkYM+/
   jTqiaUkdPTyOvUitEuOxHAeNT7yiagZ9BHOn2zPCWnhJi8W6fpcGaSmdo
   518eQvI3+aFUhpqIIJHkAMRBgDZPcy8N4o4D7k4JhY9KPm1bFrD++Wlf6
   QPzoEEJVHsAG47Mlh+gSQvaZJsXPyDEyDvJ2NZfwatou0yKYFsFauNKkf
   A==;
X-CSE-ConnectionGUID: aIo8X9wwTLm//944hYb5ag==
X-CSE-MsgGUID: OaATO/kITdeKN1/XT+YSCw==
X-IronPort-AV: E=McAfee;i="6700,10204,11378"; a="61021790"
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="61021790"
Received: from fmviesa006.fm.intel.com ([10.60.135.146])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 19 Mar 2025 14:06:20 -0700
X-CSE-ConnectionGUID: HgqzNCgTTyiSyh0X8/PRkQ==
X-CSE-MsgGUID: AXF/FY6CQiiNdf/xdlqTUw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,259,1736841600"; 
   d="scan'208";a="122618616"
Received: from lkp-server02.sh.intel.com (HELO a4747d147074) ([10.239.97.151])
  by fmviesa006.fm.intel.com with ESMTP; 19 Mar 2025 14:06:19 -0700
Received: from kbuild by a4747d147074 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tv0c2-000FfI-34;
	Wed, 19 Mar 2025 21:06:14 +0000
Date: Thu, 20 Mar 2025 05:05:07 +0800
From: kernel test robot <lkp@intel.com>
To: Jyri Sarha <jyri.sarha@linux.intel.com>
Cc: oe-kbuild-all@lists.linux.dev
Subject: [jsarha:set_multi_pipeline_state_debug 1/1]
 sound/soc/sof/ipc4-pcm.c:66:10: warning: use of unary operator that may be
 intended as compound assignment (+=)
Message-ID: <202503200412.DFJ8fDi2-lkp@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

tree:   https://github.com/jsarha/linux set_multi_pipeline_state_debug
head:   70b57c25bce492b37b15b2c8242f3af34b9fda2c
commit: 70b57c25bce492b37b15b2c8242f3af34b9fda2c [1/1] ASoC: SOF: ipc4-pcm: Pipe instances to dev_dbg in multi_pipeline_state()
config: x86_64-allmodconfig (https://download.01.org/0day-ci/archive/20250320/202503200412.DFJ8fDi2-lkp@intel.com/config)
compiler: clang version 20.1.0 (https://github.com/llvm/llvm-project 24a30daaa559829ad079f2ff7f73eb4e18095f88)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250320/202503200412.DFJ8fDi2-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503200412.DFJ8fDi2-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> sound/soc/sof/ipc4-pcm.c:66:10: warning: use of unary operator that may be intended as compound assignment (+=)
      66 |                 offset =+ snprintf(buf + offset, size - offset, " %d",
         |                        ^~
   1 warning generated.


vim +66 sound/soc/sof/ipc4-pcm.c

    58	
    59	static
    60	char *sof_ipc4_set_multi_pipeline_state_debug(struct snd_sof_dev *sdev, char *buf, size_t size,
    61						      struct ipc4_pipeline_set_state_data *trigger_list)
    62	{
    63		int i, offset = 0;
    64	
    65		for (i = 0; i < trigger_list->count; i++) {
  > 66			offset =+ snprintf(buf + offset, size - offset, " %d",
    67					   trigger_list->pipeline_instance_ids[i]);
    68	
    69			if (offset >= size - 1) {
    70				buf[size - 1] = '\0';
    71				break;
    72			}
    73		}
    74		return buf;
    75	}
    76	

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
