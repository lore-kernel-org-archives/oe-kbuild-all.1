Content-Type: multipart/mixed; boundary="===============3310822673900067199=="
MIME-Version: 1.0
From: Taras Chornyi [C] <tchornyi@marvell.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next] net: marvell: prestera: fix uninitialized vid in prestera_port_vlans_add
Date: Thu, 14 Jan 2021 21:46:55 +0000
Message-ID: <CO6PR18MB40835482AA82B3A34FCAA165C4A81@CO6PR18MB4083.namprd18.prod.outlook.com>
In-Reply-To: <20210114083556.2274440-1-olteanv@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3310822673900067199==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



________________________________________
From: Vladimir Oltean <olteanv@gmail.com>
Sent: Thursday, January 14, 2021 10:35 AM
To: David S. Miller; Jakub Kicinski; netdev(a)vger.kernel.org
Cc: Florian Fainelli; Kurt Kanzenbach; Vadym Kochan [C]; Taras Chornyi [C];=
 Ido Schimmel; clang-built-linux(a)googlegroups.com; linux-mm(a)kvack.org; =
kbuild-all(a)lists.01.org
Subject:  [PATCH net-next] net: marvell: prestera: fix uninitialized vid in=
 prestera_port_vlans_add
----------------------------------------------------------------------
From: Vladimir Oltean <vladimir.oltean@nxp.com>

prestera_bridge_port_vlan_add should have been called with vlan->vid,
however this was masked by the presence of the local vid variable and I
did not notice the build warning.

Reported-by: kernel test robot <lkp@intel.com>
Fixes: b7a9e0da2d1c ("net: switchdev: remove vid_begin -> vid_end range fro=
m VLAN objects")
Signed-off-by: Vladimir Oltean <vladimir.oltean@nxp.com>
---
 drivers/net/ethernet/marvell/prestera/prestera_switchdev.c | 3 +--
 1 file changed, 1 insertion(+), 2 deletions(-)

diff --git a/drivers/net/ethernet/marvell/prestera/prestera_switchdev.c b/d=
rivers/net/ethernet/marvell/prestera/prestera_switchdev.c
index beb6447fbe40..8c2b03151736 100644
--- a/drivers/net/ethernet/marvell/prestera/prestera_switchdev.c
+++ b/drivers/net/ethernet/marvell/prestera/prestera_switchdev.c
@@ -1007,7 +1007,6 @@ static int prestera_port_vlans_add(struct prestera_po=
rt *port,
        struct prestera_bridge_port *br_port;
        struct prestera_switch *sw =3D port->sw;
        struct prestera_bridge *bridge;
-       u16 vid;

        if (netif_is_bridge_master(dev))
                return 0;
@@ -1021,7 +1020,7 @@ static int prestera_port_vlans_add(struct prestera_po=
rt *port,
                return 0;

        return prestera_bridge_port_vlan_add(port, br_port,
-                                            vid, flag_untagged,
+                                            vlan->vid, flag_untagged,
                                             flag_pvid, extack);
 }

--
2.25.1

Reviewed-by: Taras Chornyi <tchornyi@marvell.com>
--===============3310822673900067199==--

