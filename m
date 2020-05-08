Content-Type: multipart/mixed; boundary="===============3936380782020497231=="
MIME-Version: 1.0
From: Philip Li <philip.li@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 4929/7613] ERROR: modpost: "__udivdi3" [net/openvswitch/openvswitch.ko] undefined!
Date: Fri, 08 May 2020 22:14:11 +0800
Message-ID: <20200508141411.GM14816@intel.com>
In-Reply-To: <MW3PR11MB476447F8855F59B919CC1E2CE9A20@MW3PR11MB4764.namprd11.prod.outlook.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3936380782020497231==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Fri, May 08, 2020 at 01:37:36PM +0000, Berg, Johannes wrote:
> Hi 0-day folks,
> =

> > commit: d530b9864073a714a6b6dcddee77c9b24074071f [4929/7613] staging:
> > wilc1000: adjust for management frame register API changes
> =

> =

> > All errors (new ones prefixed by >>):
> > =

> > >> ERROR: modpost: "__udivdi3" [net/openvswitch/openvswitch.ko]
> > undefined!
> > >> ERROR: modpost: "__divdi3" [net/openvswitch/openvswitch.ko]
> > undefined!
> =

> =

> Is there something wrong? Surely a change in a staging wireless driver di=
dn't cause openvswitch to gain a 64/64 bit division ...
Hi Johannes, sorry for the noise, we will check this to fix
the problem.

> =

> johannes
> Intel Deutschland GmbH
> Registered Address: Am Campeon 10-12, 85579 Neubiberg, Germany
> Tel: +49 89 99 8853-0, www.intel.de
> Managing Directors: Christin Eisenschmid, Gary Kershaw
> Chairperson of the Supervisory Board: Nicole Lau
> Registered Office: Munich
> Commercial Register: Amtsgericht Muenchen HRB 186928
> _______________________________________________
> kbuild-all mailing list -- kbuild-all(a)lists.01.org
> To unsubscribe send an email to kbuild-all-leave(a)lists.01.org
--===============3936380782020497231==--

