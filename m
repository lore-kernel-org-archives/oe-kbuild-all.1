Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.11])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6876427F00A
	for <oe-kbuild-all@lists.linux.dev>; Tue, 16 Dec 2025 10:19:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.11
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1765880349; cv=none; b=h6czvD4oDnO9Zu9zczSoWD10F+YrmGZHj1UZUbB2CYa/+tmiCpX7UGb7mu6S4twlBPVPYy00QEkoYLohf35lXAC0W1KlLZNpYgFtSOBziEA+3ZAodPBVx9Fx0zC0EMa0z1Ot6WV4runrVtHoCjzKp0VWT9gG+E4rtOXakV2U2Kc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1765880349; c=relaxed/simple;
	bh=Z5NejKRokFvRLLbsiNsAOdWAO6KfUAOCWTPlQ+whD2k=;
	h=From:Date:To:cc:Subject:In-Reply-To:Message-ID:References:
	 MIME-Version:Content-Type; b=GtgE6njWGX3pAEo6C7YtK3qw7M0/WeOgoTkVjmC5aGpTMIlXPjUgVQq24fMZeIjOAoq442g3fSMcsuyvpUbMfYEhWEEF3nu7D0zvHuhKghPUABSYOsbEGoPdUygcpIb2H5JQeHP0mRCTK9XT0dz0mlI1ARWI136nfhCPH0tZ3MA=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com; spf=pass smtp.mailfrom=linux.intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=UD0LvwjP; arc=none smtp.client-ip=198.175.65.11
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="UD0LvwjP"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1765880347; x=1797416347;
  h=from:date:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=Z5NejKRokFvRLLbsiNsAOdWAO6KfUAOCWTPlQ+whD2k=;
  b=UD0LvwjPVfOlwY150M6qwKXX3QXdAts29n1zQk86SOoW2ORMXf3MOI42
   qb80d7YQVcgpd1m4NW1ML7rImj+Vw+X5qZ22xOMQAPwDJX8WlSMitjbZ9
   p3/a2Fjsv6hnPe+sHpxYP4rGwnhqDFZRiFgU+iwh+I0EDfSvoC5zPX/ta
   C3sNRiQvylHo9KMlesAQf4D62O/rZr1KfVfHWAExQ6b839sSUUPdk64u6
   xpR5BTioiwaEB0KS8OlsDCUB8gT47AbhpHYGa5eAi+JzStO0wepdA0O+/
   PdJIag01Tz+POsAq9V7A+eQXx+IPVaxxFex69rFTS8qVdED6VUJ2ThwT2
   w==;
X-CSE-ConnectionGUID: qlMpRrDaT9yn87HKdh4dpw==
X-CSE-MsgGUID: QixO9EwTTJWgCsBhh5p5wA==
X-IronPort-AV: E=McAfee;i="6800,10657,11643"; a="78100700"
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="78100700"
Received: from fmviesa010.fm.intel.com ([10.60.135.150])
  by orvoesa103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:19:07 -0800
X-CSE-ConnectionGUID: GCN4nsqKTGK/xLte74/iPg==
X-CSE-MsgGUID: jhkL+es+TM6aMX+GThKFxw==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.21,152,1763452800"; 
   d="scan'208";a="198788628"
Received: from ijarvine-mobl1.ger.corp.intel.com (HELO localhost) ([10.245.245.4])
  by fmviesa010-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 16 Dec 2025 02:19:03 -0800
From: =?UTF-8?q?Ilpo=20J=C3=A4rvinen?= <ilpo.jarvinen@linux.intel.com>
Date: Tue, 16 Dec 2025 12:19:00 +0200 (EET)
To: Nitin <nitjoshi@gmail.com>
cc: kernel test robot <lkp@intel.com>, Hans de Goede <hansg@kernel.org>, 
    oe-kbuild-all@lists.linux.dev, platform-driver-x86@vger.kernel.org, 
    LKML <linux-kernel@vger.kernel.org>, njoshi1@lenovo.com, 
    Mark Pearson <mpearson-lenovo@squebb.ca>
Subject: Re: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to detect
 hardware damage detection capability.
In-Reply-To: <213b3f29-09ee-4305-940b-89d4652101b1@gmail.com>
Message-ID: <2433802f-ba32-1549-41f1-5a77e998c139@linux.intel.com>
References: <20251210151133.7933-1-nitjoshi@gmail.com> <202512160219.94nMjvxO-lkp@intel.com> <213b3f29-09ee-4305-940b-89d4652101b1@gmail.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII

On Tue, 16 Dec 2025, Nitin wrote:

> Hello ,
> 
> On 12/16/25 10:19, kernel test robot wrote:
> > Hi Nitin,
> > 
> > kernel test robot noticed the following build warnings:
> > 
> > [auto build test WARNING on linus/master]
> > [also build test WARNING on v6.19-rc1 next-20251215]
> > [If your patch is applied to the wrong git tree, kindly drop us a note.
> > And when submitting patch, we suggest to use '--base' as documented in
> > https://git-scm.com/docs/git-format-patch#_base_tree_information]
> > 
> > url:
> > https://github.com/intel-lab-lkp/linux/commits/Nitin-Joshi/platform-x86-thinkpad_acpi-Add-sysfs-to-display-details-of-damaged-device/20251210-231409
> > base:   linus/master
> > patch link:
> > https://lore.kernel.org/r/20251210151133.7933-1-nitjoshi%40gmail.com
> > patch subject: [PATCH v2 1/2] platform/x86: thinkpad_acpi: Add support to
> > detect hardware damage detection capability.
> > reproduce:
> > (https://download.01.org/0day-ci/archive/20251216/202512160219.94nMjvxO-lkp@intel.com/reproduce)
> > 
> > If you fix the issue in a separate patch/commit (i.e. not just a new version
> > of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes:
> > https://lore.kernel.org/oe-kbuild-all/202512160219.94nMjvxO-lkp@intel.com/
> 
> Thank you for reporting this issue and I will fix this issue .
> 
> I have already send patch v3 for this and will fix this warning in next patch
> version i.e v4 .
> 
> May i know, if its OK to add this Reported-by and closes tag in patch version
> v4 ?

Hi,

Please only add those tags when you're fixing code that exists in a repo 
already. For new work, we don't normally add lkp report tags despite the 
email suggesting you to do so (I know it's a bit confusing but it's sort 
of same as we don't normally mention all reviewers who gave improvement 
suggestions either).

> > All warnings (new ones prefixed by >>):
> > 
> >     WARNING: No kernel-doc for file ./include/linux/pci.h
> >     ERROR: Cannot find file ./include/linux/mod_devicetable.h
> >     WARNING: No kernel-doc for file ./include/linux/mod_devicetable.h
> >     ERROR: Cannot find file ./include/linux/bootconfig.h
> >     WARNING: No kernel-doc for file ./include/linux/bootconfig.h
> > > > Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title
> > > > underline too short.
> > --
> >     Hardware damage detection capability
> >     ----------------- [docutils]
> > > > Documentation/admin-guide/laptops/thinkpad-acpi.rst:1581: WARNING: Title
> > > > underline too short.
> 
> Ack. Thank you !
> 
> > 
> > vim +1581 Documentation/admin-guide/laptops/thinkpad-acpi.rst
> > 
> >    1579	
> >    1580	Hardware damage detection capability
> > > 1581	-----------------
> >    1582	
> > 
> 

-- 
 i.

