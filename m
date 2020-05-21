Content-Type: multipart/mixed; boundary="===============6766307559302348898=="
MIME-Version: 1.0
From: Shawn Guo <shawnguo@kernel.org>
To: kbuild-all@lists.01.org
Subject: Re: [RFC PATCH shawnguo] clk: imx: imx8m_clk_composite_mux_ops can be static
Date: Thu, 21 May 2020 22:39:11 +0800
Message-ID: <20200521143910.GA24084@dragon>
In-Reply-To: <20200521110439.GA55876@f61f8b3f25ca>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============6766307559302348898==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

On Thu, May 21, 2020 at 07:04:39PM +0800, kbuild test robot wrote:
> =

> Fixes: 3f0365dafe32 ("clk: imx: add mux ops for i.MX8M composite clk")
> Signed-off-by: kbuild test robot <lkp@intel.com>
> ---
>  clk-composite-8m.c |    2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
> =

> diff --git a/drivers/clk/imx/clk-composite-8m.c b/drivers/clk/imx/clk-com=
posite-8m.c
> index 8fa60f22d377f..2d9562ebddc3f 100644
> --- a/drivers/clk/imx/clk-composite-8m.c
> +++ b/drivers/clk/imx/clk-composite-8m.c
> @@ -164,7 +164,7 @@ imx8m_clk_composite_mux_determine_rate(struct clk_hw =
*hw,
>  }
>  =

>  =

> -const struct clk_ops imx8m_clk_composite_mux_ops =3D {
> +static const struct clk_ops imx8m_clk_composite_mux_ops =3D {

Amended the change.  Thanks!

Shawn

>  	.get_parent =3D imx8m_clk_composite_mux_get_parent,
>  	.set_parent =3D imx8m_clk_composite_mux_set_parent,
>  	.determine_rate =3D imx8m_clk_composite_mux_determine_rate,
--===============6766307559302348898==--

