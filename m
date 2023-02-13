Received: from mga05.intel.com (mga05.intel.com [192.55.52.43])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 068E523A5
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 10:15:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676283351; x=1707819351;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=8pxbrVMMBeuKldEB4rEpcQ/HEmb3Tvb3aO7aDW2woT8=;
  b=KNIPH2YX3Woiwsa8VovbgHTjsuOKfOVHqypepqj6I+IFbn2VieCVIcDO
   wTXKiNpvtsLDQkD0p1zPHBNXTMdNEQp5DrKIAyZTDvhL/IwUbTaAes6sU
   R9ogUITOJiATeKWz9ffoJ4AUzvpTVxwtyW7/781X/NfFtAW1hiBpwJVqg
   W28eXnVC7djA5fHDUr65vD7hTh45f4z8SGRL32RFDSpNPn+uD4YU55Pje
   NZRqRHE/Fhh4oDd0wbqvOryNDFQ9E8vGj9d1UV5SAfyVK/yrK/dQcOE82
   wD5FXMY+WtaHGpfbpq8PET94/IGPHp8Wb7f4mSLXYdPE49KkMNGK28709
   A==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="417082721"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="417082721"
Received: from orsmga002.jf.intel.com ([10.7.209.21])
  by fmsmga105.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 02:15:48 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="668753842"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="668753842"
Received: from pranavk3-mobl.gar.corp.intel.com ([10.213.82.89])
  by orsmga002-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 02:15:41 -0800
Message-ID: <6cc45a32e92e6a261b7d497eb48ac59472c35508.camel@linux.intel.com>
Subject: Re: [PATCH 1/3] Documentation: admin-guide: Add toctree entry for
 thermal docs
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
Date: Mon, 13 Feb 2023 02:15:36 -0800
In-Reply-To: <20230213100800.28333-2-bagasdotme@gmail.com>
References: <20230213100800.28333-1-bagasdotme@gmail.com>
	 <20230213100800.28333-2-bagasdotme@gmail.com>
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

On Mon, 2023-02-13 at 17:07 +0700, Bagas Sanjaya wrote:
> kernel test robot reported htmldocs warnings:
>=20
> Documentation/admin-guide/index.rst:62: WARNING: toctree contains
> reference to nonexisting document 'admin-guide/thermal'
> Documentation/admin-guide/thermal/intel_powerclamp.rst: WARNING:
> document isn't included in any toctree
>=20
> Add toctree entry for thermal/ docs to fix these warnings.
>=20
I submitted a patch=20
	[thermal-bleeding-edge][PATCH] thermal: intel: powerclamp: Fix
warnings

Thanks,
Srinivas

> Link:
> https://lore.kernel.org/linux-doc/202302121759.MmJgDTxc-lkp@intel.com/
> Fixes: 707bf8e1dfd51d ("Documentation: admin-guide: Move
> intel_powerclamp documentation")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Bagas Sanjaya <bagasdotme@gmail.com>
> ---
> =C2=A0Documentation/admin-guide/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 2 +-
> =C2=A0Documentation/admin-guide/thermal/index.rst | 8 ++++++++
> =C2=A02 files changed, 9 insertions(+), 1 deletion(-)
> =C2=A0create mode 100644 Documentation/admin-guide/thermal/index.rst
>=20
> diff --git a/Documentation/admin-guide/index.rst
> b/Documentation/admin-guide/index.rst
> index c872a8a1ddfa28..0571938ecdc868 100644
> --- a/Documentation/admin-guide/index.rst
> +++ b/Documentation/admin-guide/index.rst
> @@ -116,7 +116,7 @@ configure specific aspects of kernel behavior to
> your liking.
> =C2=A0=C2=A0=C2=A0 svga
> =C2=A0=C2=A0=C2=A0 syscall-user-dispatch
> =C2=A0=C2=A0=C2=A0 sysrq
> -=C2=A0=C2=A0 thermal
> +=C2=A0=C2=A0 thermal/index
> =C2=A0=C2=A0=C2=A0 thunderbolt
> =C2=A0=C2=A0=C2=A0 ufs
> =C2=A0=C2=A0=C2=A0 unicode
> diff --git a/Documentation/admin-guide/thermal/index.rst
> b/Documentation/admin-guide/thermal/index.rst
> new file mode 100644
> index 00000000000000..193b7b01a87d7e
> --- /dev/null
> +++ b/Documentation/admin-guide/thermal/index.rst
> @@ -0,0 +1,8 @@
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +Thermal Subsystem
> +=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> +
> +.. toctree::
> +=C2=A0=C2=A0 :maxdepth: 1
> +
> +=C2=A0=C2=A0 intel_powerclamp

