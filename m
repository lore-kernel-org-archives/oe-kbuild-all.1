Content-Type: multipart/mixed; boundary="===============3184038474666013214=="
MIME-Version: 1.0
From: Alex Elder <elder@linaro.org>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH net-next 3/3] net: ipa: support COMPILE_TEST
Date: Wed, 06 Jan 2021 13:43:33 -0600
Message-ID: <d2f55352-b774-8ce2-0693-3d7eb39ac43c@linaro.org>
In-Reply-To: <202101061555.DTUUlbsx-lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============3184038474666013214==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On 1/6/21 1:34 AM, kernel test robot wrote:
> Hi Alex,
> =

> I love your patch! Perhaps something to improve:
> =

> [auto build test WARNING on net-next/master]

I think I just need to define at the top of "gsi_trans.h":
    struct page;

I'll submit v2 of this series, with this one change
(assuming it's the correct fix).  I will incorporate
Bjorn's review tags on the first two patches.

					-Alex

> url:    https://github.com/0day-ci/linux/commits/Alex-Elder/net-ipa-suppo=
rt-COMPILE_TEST/20210106-104149
> base:   https://git.kernel.org/pub/scm/linux/kernel/git/davem/net-next.gi=
t 3db1a3fa98808aa90f95ec3e0fa2fc7abf28f5c9
> config: alpha-allyesconfig (attached as .config)
> compiler: alpha-linux-gcc (GCC) 9.3.0
> reproduce (this is a W=3D1 build):
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # https://github.com/0day-ci/linux/commit/7ab1759d9336e95f4de013b=
b171246b66f94e2f4
>         git remote add linux-review https://github.com/0day-ci/linux
>         git fetch --no-tags linux-review Alex-Elder/net-ipa-support-COMPI=
LE_TEST/20210106-104149
>         git checkout 7ab1759d9336e95f4de013bb171246b66f94e2f4
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dgcc-9.3.0 make.cros=
s ARCH=3Dalpha =

> =

> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kernel test robot <lkp@intel.com>
> =

> All warnings (new ones prefixed by >>):
> =

>    In file included from drivers/net/ipa/ipa_gsi.c:10:
>>> drivers/net/ipa/gsi_trans.h:170:56: warning: 'struct page' declared ins=
ide parameter list will not be visible outside of this definition or declar=
ation
>      170 | int gsi_trans_page_add(struct gsi_trans *trans, struct page *p=
age, u32 size,
>          |                                                        ^~~~
> =

> =

> vim +170 drivers/net/ipa/gsi_trans.h
> =

> 9dd441e4ed5755c Alex Elder 2020-03-05  149  =

> 9dd441e4ed5755c Alex Elder 2020-03-05  150  /**
> 9dd441e4ed5755c Alex Elder 2020-03-05  151   * gsi_trans_cmd_add() - Add =
an immediate command to a transaction
> 9dd441e4ed5755c Alex Elder 2020-03-05  152   * @trans:	Transaction
> 9dd441e4ed5755c Alex Elder 2020-03-05  153   * @buf:	Buffer pointer for c=
ommand payload
> 9dd441e4ed5755c Alex Elder 2020-03-05  154   * @size:	Number of bytes in =
buffer
> 9dd441e4ed5755c Alex Elder 2020-03-05  155   * @addr:	DMA address for pay=
load
> 9dd441e4ed5755c Alex Elder 2020-03-05  156   * @direction:	Direction of D=
MA transfer (or DMA_NONE if none required)
> 9dd441e4ed5755c Alex Elder 2020-03-05  157   * @opcode:	IPA immediate com=
mand opcode
> 9dd441e4ed5755c Alex Elder 2020-03-05  158   */
> 9dd441e4ed5755c Alex Elder 2020-03-05  159  void gsi_trans_cmd_add(struct=
 gsi_trans *trans, void *buf, u32 size,
> 9dd441e4ed5755c Alex Elder 2020-03-05  160  		       dma_addr_t addr, enu=
m dma_data_direction direction,
> 9dd441e4ed5755c Alex Elder 2020-03-05  161  		       enum ipa_cmd_opcode =
opcode);
> 9dd441e4ed5755c Alex Elder 2020-03-05  162  =

> 9dd441e4ed5755c Alex Elder 2020-03-05  163  /**
> 9dd441e4ed5755c Alex Elder 2020-03-05  164   * gsi_trans_page_add() - Add=
 a page transfer to a transaction
> 9dd441e4ed5755c Alex Elder 2020-03-05  165   * @trans:	Transaction
> 9dd441e4ed5755c Alex Elder 2020-03-05  166   * @page:	Page pointer
> 9dd441e4ed5755c Alex Elder 2020-03-05  167   * @size:	Number of bytes (st=
arting at offset) to transfer
> 9dd441e4ed5755c Alex Elder 2020-03-05  168   * @offset:	Offset within pag=
e for start of transfer
> 9dd441e4ed5755c Alex Elder 2020-03-05  169   */
> 9dd441e4ed5755c Alex Elder 2020-03-05 @170  int gsi_trans_page_add(struct=
 gsi_trans *trans, struct page *page, u32 size,
> 9dd441e4ed5755c Alex Elder 2020-03-05  171  		       u32 offset);
> 9dd441e4ed5755c Alex Elder 2020-03-05  172  =

> =

> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>=20

--===============3184038474666013214==--

