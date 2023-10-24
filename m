Received: from relay.hostedemail.com (smtprelay0010.hostedemail.com [216.40.44.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 57C3E1863
	for <oe-kbuild-all@lists.linux.dev>; Tue, 24 Oct 2023 05:16:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=perches.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=perches.com
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from omf05.hostedemail.com (a10.router.float.18 [10.200.18.1])
	by unirelay09.hostedemail.com (Postfix) with ESMTP id 11ACD80D4B;
	Tue, 24 Oct 2023 05:15:59 +0000 (UTC)
Received: from [HIDDEN] (Authenticated sender: joe@perches.com) by omf05.hostedemail.com (Postfix) with ESMTPA id 453B520016;
	Tue, 24 Oct 2023 05:15:56 +0000 (UTC)
Message-ID: <d3ca8db7c045909c9fff6bc3e96a7b8de1b05f8d.camel@perches.com>
Subject: Re: [PATCH V3 03/16] platform/x86/intel/vsec: Use cleanup.h
From: Joe Perches <joe@perches.com>
To: Ilpo =?ISO-8859-1?Q?J=E4rvinen?= <ilpo.jarvinen@linux.intel.com>, Andy
 Whitcroft <apw@canonical.com>, Dwaipayan Ray <dwaipayanray1@gmail.com>,
 Lukas Bulwahn <lukas.bulwahn@gmail.com>
Cc: kernel test robot <lkp@intel.com>, LKML <linux-kernel@vger.kernel.org>, 
	platform-driver-x86@vger.kernel.org, rajvi.jingar@linux.intel.com, 
	oe-kbuild-all@lists.linux.dev, "David E. Box" <david.e.box@linux.intel.com>
Date: Mon, 23 Oct 2023 22:15:55 -0700
In-Reply-To: <8fe01b6d8c558f11fe51f9da5fbfea6708766096.camel@perches.com>
References: <20231012023840.3845703-4-david.e.box@linux.intel.com>
	 <202310121314.3Xpqom2w-lkp@intel.com>
	 <6ed4cd5ae37a054d4780c8fa519dc83396b15c14.camel@linux.intel.com>
	 <b93a3e8-2d15-256a-4172-a22ef17dde9@linux.intel.com>
	 <8fe01b6d8c558f11fe51f9da5fbfea6708766096.camel@perches.com>
Content-Type: text/plain; charset="ISO-8859-1"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.48.4 (3.48.4-1.fc38) 
Precedence: bulk
X-Mailing-List: oe-kbuild-all@lists.linux.dev
List-Id: <oe-kbuild-all.lists.linux.dev>
List-Subscribe: <mailto:oe-kbuild-all+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:oe-kbuild-all+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Stat-Signature: 1bu1s17ue3tkzt64cfiuxtcbzt5z6u8e
X-Rspamd-Server: rspamout07
X-Rspamd-Queue-Id: 453B520016
X-Session-Marker: 6A6F6540706572636865732E636F6D
X-Session-ID: U2FsdGVkX1/BfWXPPjomueLq0tjzk7VysEFwj8EnymI=
X-HE-Tag: 1698124556-615886
X-HE-Meta: U2FsdGVkX1//oFGP91jE454ZqW93elOfmFLV5PdCnnVL2xiBGMydJs+EJJuBAZfq5QcLGfl7aC7XlHwBywypIJ6VXRY+i1EjpIOwVCNZDpe7Qo9hP1J/pame0gzvpmg+ltYZChg8PntfwLWtLaqHxnEiMb/1e1RIYbfuJdej79NBykaUk0yzMuUhD7wzeJ0CdtLAFISGa/s3Fc8LyYdr5mVRPFziKQzzwMAjAftj6z7rHJS94nRne+fG9YQ2CWP5kUoOaMZoLDNYW5/cP6YQge2OMC60Y0+XOy8jOt2jFX20U6b36Fo04H3SVxyDz9wZ

On Fri, 2023-10-13 at 11:14 -0700, Joe Perches wrote:
> On Fri, 2023-10-13 at 13:39 +0300, Ilpo J=E4rvinen wrote:
> > Hi,
> >=20
> > I added checkpatch people, please check what looks a false positive bel=
ow.
>=20
> Yeah, thanks I guess.
> The __free uses are very new.
> I'll play around with adding it to $Attributes
> and see what happens.
>=20
>=20
> > On Thu, 12 Oct 2023, David E. Box wrote:
> > > On Thu, 2023-10-12 at 13:25 +0800, kernel test robot wrote:
> > > > kernel test robot noticed the following build warnings:
> > > > # many are suggestions rather than must-fix
> []
> > > > ERROR:SPACING: need consistent spacing around '*' (ctx:WxV)
> > > > #31: FILE: drivers/platform/x86/intel/vsec.c:159:
> > > > +=A0=A0=A0=A0=A0=A0=A0struct intel_vsec_device __free(kfree) *intel=
_vsec_dev =3D NULL;
> > > .
> > > These looks like false positives.
> >=20
> > I agree. If I interpret the error message right checkpatch seems to thi=
nk
> > that's a multiplication which is not the case here.

So __free is an odd $Attribute as it takes an argument.
I've added it along with the other odd $Attribute __alloc_size
to another variable called $ArgAttribute and $Attribute.

Oddly, I don't understand why perl does not perform
the elimination using

	$foo =3D~ s/\b$ArgAttribute\b//g;

but does do the elimination using

	$foo =3D~ s/\b$ArgAttribute//g;

maybe something to do with the closing parenthesis in the match.

So now there is a separate substitution for this in a test.

Comments?

---
 scripts/checkpatch.pl | 14 +++++++++++---
 1 file changed, 11 insertions(+), 3 deletions(-)

diff --git a/scripts/checkpatch.pl b/scripts/checkpatch.pl
index 25fdb7fda1128..501383fa31c55 100755
--- a/scripts/checkpatch.pl
+++ b/scripts/checkpatch.pl
@@ -488,9 +488,14 @@ our $InitAttributeConst =3D qr{$InitAttributePrefix(?:=
initconst\b)};
 our $InitAttributeInit =3D qr{$InitAttributePrefix(?:init\b)};
 our $InitAttribute =3D qr{$InitAttributeData|$InitAttributeConst|$InitAttr=
ibuteInit};
=20
+our $ArgAttribute =3D qr{(?x:
+			__alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\)|
+			__free\s*\(\s*\w+\s*\)
+)};
+
 # Notes to $Attribute:
 # We need \b after 'init' otherwise 'initconst' will cause a false positiv=
e in a check
-our $Attribute	=3D qr{
+our $Attribute	=3D qr{(?x:
 			const|
 			volatile|
 			__percpu|
@@ -516,8 +521,8 @@ our $Attribute	=3D qr{
 			____cacheline_aligned_in_smp|
 			____cacheline_internodealigned_in_smp|
 			__weak|
-			__alloc_size\s*\(\s*\d+\s*(?:,\s*\d+\s*)?\)
-		  }x;
+			$ArgAttribute
+		  )};
 our $Modifier;
 our $Inline	=3D qr{inline|__always_inline|noinline|__inline|__inline__};
 our $Member	=3D qr{->$Ident|\.$Ident|\[[^]]*\]};
@@ -4091,6 +4096,9 @@ sub process {
 			# remove $Attribute/$Sparse uses to simplify comparisons
 			$sl =3D~ s/\b(?:$Attribute|$Sparse)\b//g;
 			$pl =3D~ s/\b(?:$Attribute|$Sparse)\b//g;
+			$sl =3D~ s/\b(?:$ArgAttribute)//g;
+			$pl =3D~ s/\b(?:$ArgAttribute)//g;
+
 			if (($pl =3D~ /^\+\s+$Declare\s*$Ident\s*[=3D,;:\[]/ ||
 			# function pointer declarations
 			     $pl =3D~ /^\+\s+$Declare\s*\(\s*\*\s*$Ident\s*\)\s*[=3D,;:\[\(]/ |=
|

