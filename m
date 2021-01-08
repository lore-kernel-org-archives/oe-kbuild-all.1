Content-Type: multipart/mixed; boundary="===============1482889400249213319=="
MIME-Version: 1.0
From: Rong Chen <rong.a.chen@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH v3 net-next 08/12] net: make dev_get_stats return void
Date: Fri, 08 Jan 2021 08:50:46 +0800
Message-ID: <771f44df-5da8-9e85-7854-bf69d3d335ba@intel.com>
In-Reply-To: <20210107131558.lcmuhqymqvtos2d6@skbuf>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1482889400249213319==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable



On 1/7/21 9:15 PM, Vladimir Oltean wrote:
> On Thu, Jan 07, 2021 at 09:01:03PM +0800, kernel test robot wrote:
>> Hi Vladimir,
>>
>> I love your patch! Yet something to improve:
> These are not scheduled to run on RFC series, are they?
> This report came within 3 hours of me posting an identical version to
> the RFC series from two days ago:
> https://patchwork.kernel.org/project/netdevbpf/patch/20210105185902.39229=
28-9-olteanv(a)gmail.com/
>

Hi Vladimir,

The issue was found with a rand config which was generated in Jan 7,
the bot didn't notice the issue in the RFC series:

url:https://github.com/0day-ci/linux/commits/Vladimir-Oltean/Make-ndo_get_s=
tats64-sleepable/20210107-175746
base:https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.git  3d=
b1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9
config: x86_64-randconfig-a005-20210107 (attached as .config)

Best Regards,
Rong Chen

--===============1482889400249213319==--

