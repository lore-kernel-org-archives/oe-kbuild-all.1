Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 66E231DA2D
	for <oe-kbuild-all@lists.linux.dev>; Fri, 20 Oct 2023 14:35:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linuxfoundation.org header.i=@linuxfoundation.org header.b="0I/saqYQ"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 492A5C433C8;
	Fri, 20 Oct 2023 14:35:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1697812511;
	bh=GOZZHMDvGFTmZDomEyrynqn1NJrKRN6hSxsDxGQVYAk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=0I/saqYQOfIg5Otgd1GepjdZqrrnBSK8WQ+XJQBFtKQ/E/LwYvexNilrWEn3XmImh
	 uw0TMGAx7xvjdU6DreU8gWxhdPWOfJMaFzph/FoZrUID0C01Cl5H89i0d4HDRMyuHm
	 9CLkQcacj7suzgT4PM/+9h/TvsEeaiaoNEzSZ+MI=
Date: Fri, 20 Oct 2023 16:35:07 +0200
From: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
To: Julia Lawall <julia.lawall@inria.fr>
Cc: Soumya Negi <soumya.negi97@gmail.com>,
	kernel test robot <lkp@intel.com>,
	Martyn Welch <martyn@welchs.me.uk>,
	Manohar Vanga <manohar.vanga@gmail.com>,
	Andi Shyti <andi.shyti@kernel.org>, oe-kbuild-all@lists.linux.dev
Subject: Re: [PATCH v3 1/5] staging: vme_user: Replace printk() with dev_*()
Message-ID: <2023102058-sedate-generous-487e@gregkh>
References: <a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97@gmail.com>
 <202310201236.d4IEfmLQ-lkp@intel.com>
 <20231020072602.GD27881@Negi>
 <424a1057-894d-90ec-49ce-37aac941b497@inria.fr>
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <424a1057-894d-90ec-49ce-37aac941b497@inria.fr>

On Fri, Oct 20, 2023 at 09:50:40AM +0200, Julia Lawall wrote:
> 
> 
> On Fri, 20 Oct 2023, Soumya Negi wrote:
> 
> > On Fri, Oct 20, 2023 at 01:09:26PM +0800, kernel test robot wrote:
> > > Hi Soumya,
> > >
> > > kernel test robot noticed the following build warnings:
> > >
> > > [auto build test WARNING on staging/staging-testing]
> > >
> > > url:    https://github.com/intel-lab-lkp/linux/commits/Soumya-Negi/staging-vme_user-Replace-printk-with-dev_/20231020-095619
> > > base:   staging/staging-testing
> > > patch link:    https://lore.kernel.org/r/a36a0b839f9c21efe1f2df6f9272ae882fd04fb8.1697763267.git.soumya.negi97%40gmail.com
> > > patch subject: [PATCH v3 1/5] staging: vme_user: Replace printk() with dev_*()
> > > reproduce: (https://download.01.org/0day-ci/archive/20231020/202310201236.d4IEfmLQ-lkp@intel.com/reproduce)
> > >
> > > If you fix the issue in a separate patch/commit (i.e. not just a new version of
> > > the same patch/commit), kindly add following tags
> > > | Reported-by: kernel test robot <lkp@intel.com>
> > > | Closes: https://lore.kernel.org/oe-kbuild-all/202310201236.d4IEfmLQ-lkp@intel.com/
> > >
> > > # many are suggestions rather than must-fix
> > >
> > > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_slave_get', this function's name, in a string
> > > #118: FILE: drivers/staging/vme_user/vme.c:425:
> > > +		dev_err(bridge->parent, "vme_slave_get not supported\n");
> > >
> > > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_master_set', this function's name, in a string
> > > #191: FILE: drivers/staging/vme_user/vme.c:577:
> > > +		dev_warn(bridge->parent, "vme_master_set not supported\n");
> > >
> > > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_set', this function's name, in a string
> > > #583: FILE: drivers/staging/vme_user/vme.c:1577:
> > > +		dev_err(bridge->parent, "vme_lm_set not supported\n");
> > >
> > > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_get', this function's name, in a string
> > > #600: FILE: drivers/staging/vme_user/vme.c:1613:
> > > +		dev_err(bridge->parent, "vme_lm_get not supported\n");
> > >
> > > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_attach', this function's name, in a string
> > > #617: FILE: drivers/staging/vme_user/vme.c:1650:
> > > +		dev_err(bridge->parent, "vme_lm_attach not supported\n");
> > >
> > > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_lm_detach', this function's name, in a string
> > > #634: FILE: drivers/staging/vme_user/vme.c:1683:
> > > +		dev_err(bridge->parent, "vme_lm_detach not supported\n");
> > >
> > > WARNING:EMBEDDED_FUNCTION_NAME: Prefer using '"%s...", __func__' to using 'vme_slot_num', this function's name, in a string
> > > #662: FILE: drivers/staging/vme_user/vme.c:1751:
> > > +		dev_warn(bridge->parent, "vme_slot_num not supported\n");
> > >
> > > --
> > > 0-DAY CI Kernel Test Service
> > > https://github.com/intel/lkp-tests/wiki
> >
> > Hi,
> >
> > There are changes being made in stages. This patch is replacing printk() to
> > dev_err() while keeping the message string unchanged. The function names
> > embedded are removed from the message strings by using __func__ in the next
> > patch of this patchset:
> >
> >    "[PATCH v3 2/5] staging: vme_user: Use __func__ instead of function name"
> >
> > And the warnings go away.
> >
> > Should the tags suggested by this bot be added to [PATCH v3 2/5] in this
> > case?
> 
> I think you can just ignore the bot completely in this case, because you
> already made the changes.

Agreed, this is safe to ignore, thanks.

greg k-h
