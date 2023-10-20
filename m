Received: from mail3-relais-sop.national.inria.fr (mail3-relais-sop.national.inria.fr [192.134.164.104])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B553DF5B
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 07:50:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=inria.fr
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=inria.fr
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=inria.fr header.i=@inria.fr header.b="eHs0QG++"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
  d=inria.fr; s=dc;
  h=date:from:to:cc:subject:in-reply-to:message-id:
   references:mime-version;
  bh=WQIB+GFziWayvi5xahdFmp84bcjB9XLLRxEIDRgHHEM=;
  b=eHs0QG++VICrCJP+ee9StGclH0FyW7QTs/zS8NMNWC07Zo2zvaYKVfAZ
   hZbhN2wZw8sYls8/JJCTEGoP9V0tZShHVX4Nbu9UWnMfGquo+bMSqxiqU
   2/7GsM7ncyTlFVYgPT6e2vNmXHzRMvx61TtHgMuG5NmslXqsUNSBR0PWB
   0=;
Authentication-Results: mail3-relais-sop.national.inria.fr; dkim=none (message not signed) header.i=none; spf=SoftFail smtp.mailfrom=julia.lawall@inria.fr; dmarc=fail (p=none dis=none) d=inria.fr
X-IronPort-AV: E=Sophos;i="6.03,238,1694728800"; 
   d="scan'208";a="69263647"
Received: from dhcp-138-246-3-50.dynamic.eduroam.mwn.de (HELO hadrien) ([138.246.3.50])
  by mail3-relais-sop.national.inria.fr with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Oct 2023 09:50:41 +0200
Date: Fri, 20 Oct 2023 09:50:40 +0200 (CEST)
From: Julia Lawall <julia.lawall@inria.fr>
To: Soumya Negi <soumya.negi97@gmail.com>
cc: kernel test robot <lkp@intel.com>, Martyn Welch <martyn@welchs.me.uk>, 
    Manohar Vanga <manohar.vanga@gmail.com>, 
    Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
    Andi Shyti <andi.shyti@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/5] staging: vme_user: Replace printk() with
 dev_*()
In-Reply-To: <20231020072602.GD27881@Negi>
Message-ID: <424a1057-894d-90ec-49ce-37aac941b497@inria.fr>
References: <a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97@gmail.com> <202310201236.d4IEfmLQ-lkp@intel.com> <20231020072602.GD27881@Negi>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII



On Fri, 20 Oct 2023, Soumya Negi wrote:

> On Fri, Oct 20, 2023 at 01:09:26PM +0800, kernel test robot wrote:
> > Hi Soumya,
> >
> > kernel test robot noticed the following build warnings:
> >
> > [auto build test WARNING on staging/staging-testing]
> >
> > url:    https://github.com/intel-lab-lkp/linux/commits/Soumya-Negi/staging-vme_user-Replace-printk-with-dev_/20231020-095619
> > base:   staging/staging-testing
> > patch link:    https://lore.kernel.org/r/a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97%40gmail.com
> > patch subject: [PATCH v3 1/5] staging: vme_user: Replace printk() with dev_*()
> > reproduce: (https://download.01.org/0day-ci/archive/20231020/202310201236.d4IEfmLQ-lkp@intel.com/reproduce)
> >
> > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > the same patch/commit), kindly add following tags
> > | Reported-by: kernel test robot <lkp@intel.com>
> > | Closes: https://lore.kernel.org/oe-kbuild-all/202310201236.d4IEfmLQ-lkp@intel.com/
> >
> > # many are suggestions rather than must-fix
> >
> > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_slave_get', this function's name, in a string
> > #118: FILE: drivers/staging/vme_user/vme.c:425:
> > +		dev_err(bridge->parent, "vme_slave_get not supported\n");
> >
> > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_master_set', this function's name, in a string
> > #191: FILE: drivers/staging/vme_user/vme.c:577:
> > +		dev_warn(bridge->parent, "vme_master_set not supported\n");
> >
> > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_set', this function's name, in a string
> > #583: FILE: drivers/staging/vme_user/vme.c:1577:
> > +		dev_err(bridge->parent, "vme_lm_set not supported\n");
> >
> > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_get', this function's name, in a string
> > #600: FILE: drivers/staging/vme_user/vme.c:1613:
> > +		dev_err(bridge->parent, "vme_lm_get not supported\n");
> >
> > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_attach', this function's name, in a string
> > #617: FILE: drivers/staging/vme_user/vme.c:1650:
> > +		dev_err(bridge->parent, "vme_lm_attach not supported\n");
> >
> > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_detach', this function's name, in a string
> > #634: FILE: drivers/staging/vme_user/vme.c:1683:
> > +		dev_err(bridge->parent, "vme_lm_detach not supported\n");
> >
> > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_slot_num', this function's name, in a string
> > #662: FILE: drivers/staging/vme_user/vme.c:1751:
> > +		dev_warn(bridge->parent, "vme_slot_num not supported\n");
> >
> > --
> > 0-DAY CI Kernel Test Service
> > https://github.com/intel/lkp-tests/wiki
>
> Hi,
>
> There are changes being made in stages. This patch is replacing printk() to
> dev_err() while keeping the message string unchanged. The function names
> embedded are removed from the message strings by using __func__ in the next
> patch of this patchset:
>
>    "[PATCH v3 2/5] staging: vme_user: Use __func__ instead of function name"
>
> And the warnings go away.
>
> Should the tags suggested by this bot be added to [PATCH v3 2/5] in this
> case?

I think you can just ignore the bot completely in this case, because you
already made the changes.

julia
