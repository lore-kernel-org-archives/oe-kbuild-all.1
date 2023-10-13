Received: from relay.hostedemail.com (smtprelay0016.hostedemail.com [216.40.44.16])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7A7DF200AB
	for <oe-kbuild-all@lists.linux.dev>; Fri, 13 Oct 2023 23:03:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay04.hostedemail.com (Postfix) with ESMTP id 49C3C1A049A;
	Fri, 13 Oct 2023 18:14:51 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 356972000D;
	Fri, 13 Oct 2023 18:14:48 +0000 (UTC)
Message-ID: <8fe01b6d8c558f11fe51f9da5fbfea6708766096.camel@perches.com>
Subject: Re: [PATCH V3 03/16] platform/x86/intel/vsec: Use cleanup.h
From: Joe Perches <joe@perches.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, rajvi.jingar@linux.intel.com, 
	oe-kbuild-all@lists.linux.dev, "David E. Box" <david.e.box@linux.intel.com>
Date: Fri, 13 Oct 2023 11:14:47 -0700
In-Reply-To: <b93a3e8-2d15-256a-4172-a22ef17dde9@linux.intel.com>
References: <20231012023840.3845703-4-david.e.box@linux.intel.com>
	 <202310121314.3Xpqom2w-lkp@intel.com>
	 <6ed4cd5ae37a054d4780c8fa519dc83396b15c14.camel@linux.intel.com>
	 <b93a3e8-2d15-256a-4172-a22ef17dde9@linux.intel.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: o9zcgdw1y1fgp6xy6gb8fekmn1x9as14
X-Rspamd-Server: rspamout05
X-Rspamd-Queue-Id: 356972000D
X-Spam-Status: No, score=-1.81
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX18nHPnJ1vURdIr6pxxE1KB9tF+YP2o1//s=
X-HE-Tag: 1697220888-186884
X-HE-Meta: U2FsdGVkX1/hWUvWt8vocjfvVrr5UnQAFVwrnmCEk+jm/esDnm+pfCGdCrUr/BcCexY6B0aXm/jP652/07TTyFbYRTv9qvgq6LrCL3hHnovO+6QXnaqgS3N4V91mfenpQNrEVFEmbKSo4NhPHz/byuazrDguvyhSPCsv/BjKNRITO0Ze2RCJilmsQND74dl26G3QyQnXY5MGVYW59IlWkW9m2mqNKp8gPsbmmTzl1J1GuFaOmNmADTujEjc4iLZzfffMHE2fet2guXsLJ762ZMeSwV8yq01wrVTYaGKcHPUQsW/jpAQy5YsDvCDSc4Tn

On Fri, 2023-10-13 at 13:39 +0300, Ilpo J=E4rvinen wrote:
> Hi,
>=20
> I added checkpatch people, please check what looks a false positive below=
.

Yeah, thanks I guess.
The __free uses are very new.
I'll play around with adding it to $Attributes
and see what happens.


> On Thu, 12 Oct 2023, David E. Box wrote:
> > On Thu, 2023-10-12 at 13:25 +0800, kernel test robot wrote:
> > > kernel test robot noticed the following build warnings:
> > > # many are suggestions rather than must-fix
[]
> > > ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
> > > #31: FILE: drivers/platform/x86/intel/vsec.c:159:
> > > +=A0=A0=A0=A0=A0=A0=A0struct intel_vsec_device __free(kfree) *intel_v=
sec_dev =3D NULL;
> >=20
> > These looks like false positives.
>=20
> I agree. If I interpret the error message right checkpatch seems to think
> that's a multiplication which is not the case here.
