Content-Type: multipart/mixed; boundary="===============7706569303600683630=="
MIME-Version: 1.0
From: Nikolay Aleksandrov <nikolay@nvidia.com>
To: kbuild-all@lists.01.org
Subject: Re: [net-next:master 40/65] net/bridge/br_input.c:135:8: error: too many arguments to function 'br_multicast_is_router'
Date: Fri, 14 May 2021 13:12:12 +0300
Message-ID: <7dde3521-3df5-8b65-b6a9-c974b84ab0eb@nvidia.com>
In-Reply-To: <CA+G9fYuSVLOOu0aEs1bm5myxDMGe1VK_MVm61BmY3dwDx_yRmA@mail.gmail.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============7706569303600683630==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 14/05/2021 13:06, Naresh Kamboju wrote:
> [Please ignore this email if you already know these build failures]
> =

> + Adding maintainers
> =

> On Fri, 14 May 2021 at 06:35, kernel test robot <lkp@intel.com> wrote:
>>
>> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.g=
it master
>> head:   ea89c862f01e02ec459932c7c3113fa37aedd09a
>> commit: 1a3065a26807b4cdd65d3b696ddb18385610f7da [40/65] net: bridge: mc=
ast: prepare is-router function for mcast router split
>> config: um-randconfig-s032-20210514 (attached as .config)
>> compiler: gcc-9 (Debian 9.3.0-22) 9.3.0
>> reproduce:
>>         # apt-get install sparse
>>         # sparse version: v0.6.3-341-g8af24329-dirty
>>         # https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next=
.git/commit/?id=3D1a3065a26807b4cdd65d3b696ddb18385610f7da
>>         git remote add net-next https://git.kernel.org/pub/scm/linux/ker=
nel/git/davem/net-next.git
>>         git fetch --no-tags net-next master
>>         git checkout 1a3065a26807b4cdd65d3b696ddb18385610f7da
>>         # save the attached .config to linux build tree
>>         make W=3D1 C=3D1 CF=3D'-fdiagnostic-prefix -D__CHECK_ENDIAN__' W=
=3D1 ARCH=3Dum
>>
>> If you fix the issue, kindly add following tag as appropriate
>> Reported-by: kernel test robot <lkp@intel.com>
>>
>> All errors (new ones prefixed by >>):
>>
>>    net/bridge/br_input.c: In function 'br_handle_frame_finish':
>>>> net/bridge/br_input.c:135:8: error: too many arguments to function 'br=
_multicast_is_router'
>>      135 |        br_multicast_is_router(br, skb)) {
>>          |        ^~~~~~~~~~~~~~~~~~~~~~
>>    In file included from net/bridge/br_input.c:23:
>>    net/bridge/br_private.h:1059:20: note: declared here
>>     1059 | static inline bool br_multicast_is_router(struct net_bridge *=
br)
>>          |                    ^~~~~~~~~~~~~~~~~~~~~~
>>

I have already sent a patch for this one:
https://patchwork.kernel.org/project/netdevbpf/patch/20210514073233.2564187=
-1-razor(a)blackwall.org/


--===============7706569303600683630==--

