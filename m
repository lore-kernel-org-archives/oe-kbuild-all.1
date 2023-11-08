Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D7E721094A
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 10:02:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="LA9z6Npu"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699437747; x=1730973747;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=xy8VHwvmtWAJLHvAypTkiiYFU8EEYIpFQG/gcU7/1hw=;
  b=LA9z6NpuCZBqJiVwM3SEZMYxrR+SiYBd1WojZIa2+10x4IWaEuGt55lW
   vstcQdcXcBmqT/hZOAMQzqjKM7zEckod2xOPsEcdD615g6ZAHia5itl9H
   aQ15mmN97030TkJR/EmHzNV99jEIidKSFhXy1GXdpeDtwB+4t7aUuDM1I
   DQyx9hW8TAyDiLWegdwObfKcwxh889pR9ILdTZaEKEvNVifwHVrLAL4Vw
   T8866NNerJXAElbJqbFaEdIrAa0qYmB3bYiNy/HMdT0hrmtEPnfPb3ps6
   zW2Vtd0w9eueva0bURnVztqN4z2KmpyUwpHAZeIjNgStDDFYXIA/r69VI
   g==;
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="11285488"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="11285488"
Received: from fmsmga008.fm.intel.com ([10.253.24.58])
  by fmvoesa101.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 02:02:23 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10887"; a="828921245"
X-IronPort-AV: E=Sophos;i="6.03,285,1694761200"; 
   d="scan'208";a="828921245"
Received: from rwyszeck-mobl.ger.corp.intel.com (HELO localhost) ([10.252.53.217])
  by fmsmga008-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 02:02:20 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: kernel test robot <yujie.liu@intel.com>, Oak Zeng <oak.zeng@intel.com>,
 Rodrigo Vivi <rodrigo.vivi@intel.com>, intel-xe@lists.freedesktop.org,
 oe-kbuild-all@lists.linux.dev
Subject: Re: [Intel-xe] [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
In-Reply-To: <j7woryfaopndy26jdcsteie5lsacghy74fvw646rxm7eliaey5@4nlicq3xlzfv>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202311070416.8nPv4n6G-lkp@intel.com> <87a5rqymy8.fsf@intel.com>
 <j7woryfaopndy26jdcsteie5lsacghy74fvw646rxm7eliaey5@4nlicq3xlzfv>
Date: Wed, 08 Nov 2023 12:02:17 +0200
Message-ID: <87fs1gy34m.fsf@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Tue, 07 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Tue, Nov 07, 2023 at 10:41:51AM +0200, Jani Nikula wrote:
>>On Tue, 07 Nov 2023, kernel test robot <yujie.liu@intel.com> wrote:
>>> tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
>>
>>Why do we have this stale branch? I don't think developers should push
>>their branches to xe/kernel.git but their own repos instead.
>
> agreed. I just blocked branch creation in gitlab so we don't have
> those accidents anymore.

I was looking for this yesterday. For future reference, which knob is it
and where in the gitlab UI?

TIA,
Jani.


-- 
Jani Nikula, Intel
