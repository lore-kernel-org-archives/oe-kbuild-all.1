Content-Type: multipart/mixed; boundary="===============0232735909574047047=="
MIME-Version: 1.0
From: Florian Fainelli <f.fainelli@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next] net: marvell: prestera: fix uninitialized vid in prestera_port_vlans_add
Date: Thu, 14 Jan 2021 10:48:00 -0800
Message-ID: <03979f1b-851e-d5ff-2928-323f5aed696e@gmail.com>
In-Reply-To: <20210114083556.2274440-1-olteanv@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0232735909574047047==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/14/21 12:35 AM, Vladimir Oltean wrote:
> From: Vladimir Oltean <vladimir.oltean@nxp.com>
> =

> prestera_bridge_port_vlan_add should have been called with vlan->vid,
> however this was masked by the presence of the local vid variable and I
> did not notice the build warning.
> =

> Reported-by: kernel test robot <lkp@intel.com>
> Fixes: b7a9e0da2d1c ("net: switchdev: remove vid_begin -> vid_end range f=
rom VLAN objects")
> Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- =

Florian
--===============0232735909574047047==--

