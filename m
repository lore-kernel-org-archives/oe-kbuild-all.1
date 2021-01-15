Content-Type: multipart/mixed; boundary="===============0498350917692012760=="
MIME-Version: 1.0
From: patchwork-bot+netdevbpf@kernel.org
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next] net: marvell: prestera: fix uninitialized vid in prestera_port_vlans_add
Date: Fri, 15 Jan 2021 00:50:08 +0000
Message-ID: <
 <161067180848.3913.16168009401254422093.git-patchwork-notify@kernel.org>>
In-Reply-To: <20210114083556.2274440-1-olteanv@gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============0498350917692012760==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hello:

This patch was applied to netdev/net-next.git (refs/heads/master):

On Thu, 14 Jan 2021 10:35:56 +0200 you wrote:
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
> =

> [...]

Here is the summary with links:
  - [net-next] net: marvell: prestera: fix uninitialized vid in prestera_po=
rt_vlans_add
    https://git.kernel.org/netdev/net-next/c/c612fe780803

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


--===============0498350917692012760==--

