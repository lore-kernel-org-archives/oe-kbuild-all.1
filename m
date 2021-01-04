Content-Type: multipart/mixed; boundary="===============8506287579096498644=="
MIME-Version: 1.0
From: Chanwoo Choi <cwchoi00@gmail.com>
To: kbuild-all@lists.01.org
Subject: Re: [PATCH] extcon: Add stubs for extcon_register_notifier_all() functions
Date: Mon, 04 Jan 2021 19:32:17 +0900
Message-ID: <CAGTfZH20USDdNLLkjC5QsxYnQU6hnG4esbf7gf91pvw0GqZPBQ@mail.gmail.com>
In-Reply-To: <20201231085252.69831-1-krzk@kernel.org>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8506287579096498644==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

On Thu, Dec 31, 2020 at 5:56 PM Krzysztof Kozlowski <krzk@kernel.org> wro=
te:
>
> Add stubs for extcon_register_notifier_all() function for !CONFIG_EXTCON
> case.  This is useful for compile testing and for drivers which use
> EXTCON but do not require it (therefore do not depend on CONFIG_EXTCON).
>
> Fixes: 815429b39d94 ("extcon: Add new extcon_register_notifier_all() to m=
onitor all external connectors")
> Reported-by: kernel test robot <lkp@intel.com>
> Signed-off-by: Krzysztof Kozlowski <krzk@kernel.org>
> ---
>  include/linux/extcon.h | 23 +++++++++++++++++++++++
>  1 file changed, 23 insertions(+)
>
> diff --git a/include/linux/extcon.h b/include/linux/extcon.h
> index fd183fb9c20f..0c19010da77f 100644
> --- a/include/linux/extcon.h
> +++ b/include/linux/extcon.h
> @@ -271,6 +271,29 @@ static inline  void devm_extcon_unregister_notifier(=
struct device *dev,
>                                 struct extcon_dev *edev, unsigned int id,
>                                 struct notifier_block *nb) { }
>
> +static inline int extcon_register_notifier_all(struct extcon_dev *edev,
> +                                              struct notifier_block *nb)
> +{
> +       return 0;
> +}
> +
> +static inline int extcon_unregister_notifier_all(struct extcon_dev *edev,
> +                                                struct notifier_block *n=
b)
> +{
> +       return 0;
> +}
> +
> +static inline int devm_extcon_register_notifier_all(struct device *dev,
> +                                                   struct extcon_dev *ed=
ev,
> +                                                   struct notifier_block=
 *nb)
> +{
> +       return 0;
> +}
> +
> +static inline void devm_extcon_unregister_notifier_all(struct device *de=
v,
> +                                                      struct extcon_dev =
*edev,
> +                                                      struct notifier_bl=
ock *nb) { }
> +
>  static inline struct extcon_dev *extcon_get_extcon_dev(const char *extco=
n_name)
>  {
>         return ERR_PTR(-ENODEV);
> --
> 2.25.1
>

Applied it. Thanks.

-- =

Best Regards,
Chanwoo Choi
--===============8506287579096498644==--

