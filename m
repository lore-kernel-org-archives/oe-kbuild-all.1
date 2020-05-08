Content-Type: multipart/mixed; boundary="===============6289523398818747784=="
MIME-Version: 1.0
From: Berg, Johannes <johannes.berg@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [linux-next:master 4929/7613] ERROR: modpost: "__udivdi3" [net/openvswitch/openvswitch.ko] undefined!
Date: Fri, 08 May 2020 13:37:36 +0000
Message-ID: <MW3PR11MB476447F8855F59B919CC1E2CE9A20@MW3PR11MB4764.namprd11.prod.outlook.com>
In-Reply-To: <202005082038.FVWvWZgH%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6289523398818747784==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi 0-day folks,

> commit: d530b9864073a714a6b6dcddee77c9b24074071f [4929/7613] staging:
> wilc1000: adjust for management frame register API changes


> All errors (new ones prefixed by >>):
> =

> >> ERROR: modpost: "__udivdi3" [net/openvswitch/openvswitch.ko]
> undefined!
> >> ERROR: modpost: "__divdi3" [net/openvswitch/openvswitch.ko]
> undefined!


Is there something wrong? Surely a change in a staging wireless driver didn=
't cause openvswitch to gain a 64/64 bit division ...

johannes
Intel Deutschland GmbH
Registered Address: Am Campeon 10-12, 85579 Neubiberg, Germany
Tel: +49 89 99 8853-0, www.intel.de
Managing Directors: Christin Eisenschmid, Gary Kershaw
Chairperson of the Supervisory Board: Nicole Lau
Registered Office: Munich
Commercial Register: Amtsgericht Muenchen HRB 186928

--===============6289523398818747784==--

