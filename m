Received: from mgamail.intel.com (mgamail.intel.com [134.134.136.126])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 9B479328C6
	for <oe-kbuild-all@lists.linux.dev>; Wed,  8 Nov 2023 17:37:35 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="aNsMiPXR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1699465055; x=1731001055;
  h=from:to:cc:subject:in-reply-to:references:date:
   message-id:mime-version;
  bh=y9I4QX0S28uiRHsq1BYjlsRHIXj6aKMFQBOvwnAUZfA=;
  b=aNsMiPXRSqgoadVxmba7c9Gl35eR3Bz9zIC0cM2Swll/hU5Epo8xeyGb
   Vejd7FXAYAhEbRnoGsVCtcMp7CKq7A+tLT72ycJgbghT+2lIGP+/b+PFS
   9ii4GQ1QcxSuz9TLURfbkGg2WAXcNGNXD8NbHxeTUx4dpaN0HCQtbQVOJ
   KEPF4JJmQW6ubgu/Koq0R/8Is2+bWeQ0tHdVsv2bpsjL0rWxCEISNl59a
   pbW33Wt3zLrEGfgyD58FSTarRmdmVJMg5rIBY0cY+4SGDxf7wACfFIaOq
   mHAlbjCC8e10d6Cln7NIb1kl6FCyitj3FB1uU0wOaXMmYiiZR0Ne4RHZQ
   w==;
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="374864163"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="374864163"
Received: from orsmga004.jf.intel.com ([10.7.209.38])
  by orsmga106.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 09:37:34 -0800
X-ExtLoop1: 1
X-IronPort-AV: E=McAfee;i="6600,9927,10888"; a="886722707"
X-IronPort-AV: E=Sophos;i="6.03,286,1694761200"; 
   d="scan'208";a="886722707"
Received: from vseredyx-mobl.ger.corp.intel.com (HELO localhost) ([10.252.38.119])
  by orsmga004-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 08 Nov 2023 09:37:32 -0800
From: Jani Nikula <jani.nikula@intel.com>
To: Lucas De Marchi <lucas.demarchi@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, kernel test robot <yujie.liu@intel.com>,
 intel-xe@lists.freedesktop.org, Rodrigo Vivi <rodrigo.vivi@intel.com>
Subject: Re: [Intel-xe] [drm-xe:oak/drm-evictable-lru 2911/3055]
 drivers/gpu/drm/i915/display/intel_display_power.h: linux/mutex.h is
 included more than once.
In-Reply-To: <i5hiabop2gm67f7yl4zvszqvtczoof3v55ikpt6k7i2ejmglut@reausbodh5kn>
Organization: Intel Finland Oy - BIC 0357606-4 - Westendinkatu 7, 02160 Espoo
References: <202311070416.8nPv4n6G-lkp@intel.com> <87a5rqymy8.fsf@intel.com>
 <j7woryfaopndy26jdcsteie5lsacghy74fvw646rxm7eliaey5@4nlicq3xlzfv>
 <87fs1gy34m.fsf@intel.com>
 <i5hiabop2gm67f7yl4zvszqvtczoof3v55ikpt6k7i2ejmglut@reausbodh5kn>
Date: Wed, 08 Nov 2023 19:37:30 +0200
Message-ID: <875y2cxi1x.fsf@intel.com>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain

On Wed, 08 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
> On Wed, Nov 08, 2023 at 12:02:17PM +0200, Jani Nikula wrote:
>>On Tue, 07 Nov 2023, Lucas De Marchi <lucas.demarchi@intel.com> wrote:
>>> On Tue, Nov 07, 2023 at 10:41:51AM +0200, Jani Nikula wrote:
>>>>On Tue, 07 Nov 2023, kernel test robot <yujie.liu@intel.com> wrote:
>>>>> tree:   https://gitlab.freedesktop.org/drm/xe/kernel.git oak/drm-evictable-lru
>>>>
>>>>Why do we have this stale branch? I don't think developers should push
>>>>their branches to xe/kernel.git but their own repos instead.
>>>
>>> agreed. I just blocked branch creation in gitlab so we don't have
>>> those accidents anymore.
>>
>>I was looking for this yesterday. For future reference, which knob is it
>>and where in the gitlab UI?
>
> Settings > Repository > Protected branches
>
> 	- "drm-xe-next" [default] [protected]
> 		- Allowed to merge: Maintainers
> 		- Allowed to push and merge: Developers + Maintainers, Maintainers
>
> 	"*" (12 matching branches)
> 		- Allowed to push and merge: No one 
> 		- Allowed to merge: No one

Right. I was close. I was looking at branch rules, and adding a branch
rule says, "To create a branch rule, you first need to create a
protected branch." but I didn't want to create a branch. Even under
protected branches it says, "Add protected branch", but I didn't want to
*add* branches, just prevent pushing. Oh well.

Thanks for doing this.

> I thought about creating a role to allow branch creation, but to keep it
> simple, I just blocked it. When/if we need it then we can temporarily
> disable the rule, like we do for force pushes when we rebase.

I'm not even sure you can add new roles in the free version.


BR,
Jani.

-- 
Jani Nikula, Intel
