Received: from mga07.intel.com (mga07.intel.com [134.134.136.100])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2CB4823A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 10:17:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676283445; x=1707819445;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=zeloRDIsdgzAHn0ZJQF6AbWhXizumlB5mC7D3T++dzA=;
  b=EEviabSCYOyukK3B3S1kxk81SW1OpTH3hvjq9oreSBMsBgrjiaOuEHfN
   p9R1rKk7GyRL38WB2KRtNqsYT8k+S76ludA/nEwbBf0FpNBqqbXcQ+Vu+
   XtiGNkyYrrU2LSQd8gTyPGyjcxPBd0pHX81ki4VbaexsuB7A/7u5+EB30
   Imr3Le5lgLzS9jMiFLNQyz2diV/8ojUR4xY9B9dhvnz2zTHXQ25fIY2e/
   ij0fxetbp/qTHL0Xr/di9txN4h2QpG3FJj6SAz7sARTMaqOUvDfWPymRT
   4CWp0MFFTP/H8KVWiN2rClmvtzTIymGelqT1yD6jUI2f0tMbPq+GHNTPU
   Q==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="395470640"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="395470640"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga105.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 02:17:11 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="737461951"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="737461951"
Received: from pranavk3-mobl.gar.corp.intel.com ([10.213.82.89])
  by fmsmga004-auth.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 02:17:05 -0800
Message-ID: <8367d92de90afaaa7ec5fac1dbcc0337ab641cb6.camel@linux.intel.com>
Subject: Re: [PATCH 2/3] Documentation: powerclamp: Escape wildcard in
 cpumask description
From: srinivas pandruvada <srinivas.pandruvada@linux.intel.com>
To: Bagas Sanjaya <bagasdotme@gmail.com>, Linux Documentation
	 <linux-doc@vger.kernel.org>, Linux Kernel Mailing List
	 <linux-kernel@vger.kernel.org>, Linux Power Management
	 <linux-pm@vger.kernel.org>
Cc: Jonathan Corbet <corbet@lwn.net>, "Rafael J. Wysocki"
 <rafael@kernel.org>,  Daniel Lezcano <daniel.lezcano@linaro.org>, Amit
 Kucheria <amitk@kernel.org>, Zhang Rui <rui.zhang@intel.com>,  Thorsten
 Leemhuis <linux@leemhuis.info>, Mauro Carvalho Chehab
 <mchehab+samsung@kernel.org>, Arjan van de Ven <arjan@linux.intel.com>,
 Jacob Pan <jacob.jun.pan@linux.intel.com>,  oe-kbuild-all@lists.linux.dev,
 kernel test robot <lkp@intel.com>
Date: Mon, 13 Feb 2023 02:17:02 -0800
In-Reply-To: <20230213100800.28333-3-bagasdotme@gmail.com>
References: <20230213100800.28333-1-bagasdotme@gmail.com>
	 <20230213100800.28333-3-bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

Hi Sanjaya,

On Mon, 2023-02-13 at 17:08 +0700, Bagas Sanjaya wrote:
> kernel test robot reported htmldocs warning:
>=20
> Documentation/admin-guide/thermal/intel_powerclamp.rst:328: WARNING:
> Inline emphasis start-string without end-string.
>=20
> The mistaken asterisk in /proc/irq/*/smp_affinity is rendered as
> hyperlink
> as the result.
>=20
I submitted a patch=20
	[thermal-bleeding-edge][PATCH] thermal: intel: powerclamp: Fix
warnings.

Thanks,
Srinivas

> Escape the asterisk to fix above warning.
>=20
> Link:
> https://lore.kernel.org/linux-doc/202302122247.N4S791c4-lkp@intel.com/
> Fixes: ebf51971021881 ("thermal: intel: powerclamp: Add two module
> parameters")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> =C2=A0Documentation/admin-guide/thermal/intel_powerclamp.rst | 2 +-
> =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
>=20
> diff --git a/Documentation/admin-guide/thermal/intel_powerclamp.rst
> b/Documentation/admin-guide/thermal/intel_powerclamp.rst
> index 2d9d2d739f0256..f919fbe1cdd942 100644
> --- a/Documentation/admin-guide/thermal/intel_powerclamp.rst
> +++ b/Documentation/admin-guide/thermal/intel_powerclamp.rst
> @@ -326,7 +326,7 @@ Module Parameters
> =C2=A0
> =C2=A0``cpumask`` (RW)
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0A bit mask of CPUs to inj=
ect idle. The format of the bitmask
> is same as
> -=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0used in other subsystems like =
in /proc/irq/*/smp_affinity.
> The mask is
> +=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0used in other subsystems like =
in /proc/irq/\*/smp_affinity.
> The mask is
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0comma separated 32 bit gr=
oups. Each CPU is one bit. For
> example for a 256
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0CPU system the full mask =
is:
> =C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0ffffffff,ffffffff,fffffff=
f,ffffffff,ffffffff,ffffffff,fffffff
> f,ffffffff

