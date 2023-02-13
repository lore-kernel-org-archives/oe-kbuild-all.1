Received: from mga03.intel.com (mga03.intel.com [134.134.136.65])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6B824256F
	for <oe-kbuild-all@lists.linux.dev>; Mon, 13 Feb 2023 10:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1676283514; x=1707819514;
  h=message-id:subject:from:to:cc:date:in-reply-to:
   references:content-transfer-encoding:mime-version;
  bh=I9F1qR4NteqwtlKM1//KDqNo9wf1t44txFT2AWm9PnY=;
  b=Oioy1tGT/INkGcpoNr2psDMOGlwq+t2rL6Rqac1/6FcQNu4H9C9j2GGb
   IaQVGFYGQdIaH3AtIyrAUW0tC+BHoXvPIoE3Nc18ypOh7xmPH4dD9+x4T
   78jsWED7le8H9o72sOoTL35jvAD/JMl6dFyRs9VGV1EtE3gCeP8R7+Ec/
   ZvhHGCgbmtdF1orBCD838zvD56AMSUVNJsQOufY/vk69cbHWrTX1m6B+z
   nbY2bTcmGdgYLtSWITX6YHsyRTKlyj25LTZzKHynxxS7s+ilzvwbbH2VB
   yVniXCaQCW0cAdykYJvW1+B85F5ZlFTkwB2QA1xMHnDLEyd4IHf/AcASh
   w==;
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="332996175"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="332996175"
Received: from orsmga007.jf.intel.com ([10.7.209.58])
  by orsmga103.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 02:18:32 -0800
X-IronPort-AV: E=McAfee;i="6500,9779,10619"; a="662132180"
X-IronPort-AV: E=Sophos;i="5.97,293,1669104000"; 
   d="scan'208";a="662132180"
Received: from pranavk3-mobl.gar.corp.intel.com ([10.213.82.89])
  by orsmga007-auth.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 13 Feb 2023 02:18:26 -0800
Message-ID: <f6fc39d2060c964d32b6610956b66e8d3151d926.camel@linux.intel.com>
Subject: Re: [PATCH 0/3] Documentation fixes for thermal/bleeding-edge
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
 Jacob Pan <jacob.jun.pan@linux.intel.com>,  oe-kbuild-all@lists.linux.dev
Date: Mon, 13 Feb 2023 02:18:23 -0800
In-Reply-To: <20230213100800.28333-1-bagasdotme@gmail.com>
References: <20230213100800.28333-1-bagasdotme@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.44.4-0ubuntu1 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0

On Mon, 2023-02-13 at 17:07 +0700, Bagas Sanjaya wrote:
> Here are documentation fixes for thermal/bleeding-edge tree. The
> first two patches are fixes to recently reported kernel test robot
> reports whereas the third patch is cosmetical (formatting).
>=20
I am fine picking up this patchset over mine, as this series has  one
additional fix.

	[thermal-bleeding-edge][PATCH] thermal: intel: powerclamp: Fix
warnings

Thanks,
Srinivas


> Bagas Sanjaya (3):
> =C2=A0 Documentation: admin-guide: Add toctree entry for thermal docs
> =C2=A0 Documentation: powerclamp: Escape wildcard in cpumask description
> =C2=A0 Documentation: powerclamp: Fix numbered lists formatting
>=20
> =C2=A0Documentation/admin-guide/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0Documentation/admin-guide/thermal/index.rst=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0 |=C2=A0 8 ++++++++
> =C2=A0.../admin-guide/thermal/intel_powerclamp.rst=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 +++++++++----
> --
> =C2=A03 files changed, 18 insertions(+), 7 deletions(-)
> =C2=A0create mode 100644 Documentation/admin-guide/thermal/index.rst
>=20
>=20
> base-commit: 1c7337f9eef60b8ce8a4b8c96d197e230d60b6b2

