Content-Type: multipart/mixed; boundary="===============1525227657958492242=="
MIME-Version: 1.0
From: Björn Töpel <bjorn.topel@intel.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH bpf-next v2 4/8] xsk: register XDP sockets at bind(), and add new AF_XDP BPF helper
Date: Wed, 20 Jan 2021 09:41:23 +0100
Message-ID: <20e6b170-21f8-bae0-e775-73bd387b939a@intel.com>
In-Reply-To: <202101201622.G3pwF7Zj-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============1525227657958492242==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 2021-01-20 09:25, kernel test robot wrote:
> Hi "Bj=C3=B6rn,
> =

> I love your patch! Yet something to improve:
> =

> [auto build test ERROR on 95204c9bfa48d2f4d3bab7df55c1cc823957ff81]
> =

> url:    https://github.com/0day-ci/linux/commits/Bj-rn-T-pel/Introduce-bp=
f_redirect_xsk-helper/20210120-150357
> base:    95204c9bfa48d2f4d3bab7df55c1cc823957ff81
> config: x86_64-randconfig-m031-20210120 (attached as .config)
> compiler: gcc-9 (Debian 9.3.0-15) 9.3.0
> reproduce (this is a W=3D1 build):
>          # https://github.com/0day-ci/linux/commit/419b1341d7980ee57fb10f=
4306719eef3c1a15f8
>          git remote add linux-review https://github.com/0day-ci/linux
>          git fetch --no-tags linux-review Bj-rn-T-pel/Introduce-bpf_redir=
ect_xsk-helper/20210120-150357
>          git checkout 419b1341d7980ee57fb10f4306719eef3c1a15f8
>          # save the attached .config to linux build tree
>          make W=3D1 ARCH=3Dx86_64
> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All errors (new ones prefixed by >>):
> =

>     In file included from <command-line>:
>     net/core/filter.c: In function '____bpf_xdp_redirect_xsk':
>>> net/core/filter.c:4165:35: error: 'struct netdev_rx_queue' has no membe=
r named 'xsk'

This rev is missing proper CONFIG_XDP_SOCKET ifdefs. I'll fix this in
the next spin, but I'll wait a bit for more comments.


Bj=C3=B6rn

[...]
--===============1525227657958492242==--

