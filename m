Content-Type: multipart/mixed; boundary="===============8717149364521302844=="
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
To: kbuild-all@lists.01.org
Subject: Re: [linuxtv-media:master 440/495] drivers/staging/media/atomisp/pci/atomisp_cmd.c:4278:17: warning: address of 'config->info' will always evaluate to 'true'
Date: Wed, 20 May 2020 12:42:00 -0700
Message-ID: <CAKwvOd=TcBkzbBFX3EFK5VgO8JojZjdRbozHbew81da-wKJ3hg@mail.gmail.com>
In-Reply-To: <202005210222.fkqS2pnd%lkp@intel.com>
List-Id: <oe-kbuild-all.lists.linux.dev>

--===============8717149364521302844==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable

Hi Philip,
Any thoughts on why this wasn't sent to the author?  I know we
restrict LLD warnings, but this case doesn't look like it's from LLD.

On Wed, May 20, 2020 at 11:54 AM kbuild test robot <lkp@intel.com> wrote:
>
> CC: linux-media(a)vger.kernel.org
> TO: Mauro Carvalho Chehab <mchehab@kernel.org>
> CC: linux-media(a)vger.kernel.org
>
> Hi Mauro,
>
> First bad commit (maybe !=3D root cause):
>
> tree:   git://linuxtv.org/media_tree.git master
> head:   960b2dee908b0fc51cf670841de13b40b44aaaae
> commit: 9d4fa1a16b28b1d12b0378993d2d48f572a045d9 [440/495] media: atomisp=
: cleanup directory hierarchy
> config: x86_64-allyesconfig (attached as .config)
> compiler: clang version 11.0.0 (https://github.com/llvm/llvm-project e665=
8079aca6d971b4e9d7137a3a2ecbc9c34aec)
> reproduce:
>         wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbi=
n/make.cross -O ~/bin/make.cross
>         chmod +x ~/bin/make.cross
>         # install x86_64 cross compiling tool for clang build
>         # apt-get install binutils-x86-64-linux-gnu
>         git checkout 9d4fa1a16b28b1d12b0378993d2d48f572a045d9
>         # save the attached .config to linux build tree
>         COMPILER_INSTALL_PATH=3D$HOME/0day COMPILER=3Dclang make.cross AR=
CH=3Dx86_64
>
> If you fix the issue, kindly add following tag as appropriate
> Reported-by: kbuild test robot <lkp@intel.com>
>
> All warnings (new ones prefixed by >>, old ones prefixed by <<):
>
> >> drivers/staging/media/atomisp/pci/atomisp_cmd.c:4278:17: warning: addr=
ess of 'config->info' will always evaluate to 'true' [-Wpointer-bool-conver=
sion]
> if (!&config->info) {
> ~ ~~~~~~~~^~~~
> 1 warning generated.
> --
> >> drivers/staging/media/atomisp/pci/sh_css.c:8621:14: warning: address o=
f 'pipe->output_stage' will always evaluate to 'true' [-Wpointer-bool-conve=
rsion]
> if (&pipe->output_stage)
> ~~   ~~~~~~^~~~~~~~~~~~
> >> drivers/staging/media/atomisp/pci/sh_css.c:8629:14: warning: address o=
f 'pipe->vf_stage' will always evaluate to 'true' [-Wpointer-bool-conversio=
n]
> if (&pipe->vf_stage)
> ~~   ~~~~~~^~~~~~~~
> >> drivers/staging/media/atomisp/pci/sh_css.c:2460:1: warning: stack fram=
e size of 27088 bytes in function 'create_pipe' [-Wframe-larger-than=3D]
> create_pipe(enum ia_css_pipe_mode mode,
> ^
> 3 warnings generated.
> --
> >> drivers/staging/media/atomisp/pci/isp/kernels/xnr/xnr_3.0/ia_css_xnr3.=
host.c:148:35: warning: implicit conversion from 'unsigned long' to 'int32_=
t' (aka 'int') changes value from 18446744073709543424 to -8192 [-Wconstant=
-conversion]
> return MAX(MIN(isp_strength, 0), -XNR_BLENDING_SCALE_FACTOR);
> ~~~~~~ ~~~~~~~~~~~~~~~~~~~~~~~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~
> drivers/staging/media/atomisp//pci/hive_isp_css_include/math_support.h:35=
:52: note: expanded from macro 'MAX'
> #define MAX(a, b)            (((a) > (b)) ? (a) : (b))
> ^
> 1 warning generated.
>
> vim +4278 drivers/staging/media/atomisp/pci/atomisp_cmd.c
>
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4260
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4261  /*
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4262   * Function to set/get isp parameter=
s to isp
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4263   */
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4264  int atomisp_param(struct atomisp_sub=
_device *asd, int flag,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4265                    struct atomisp_par=
m *config)
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4266  {
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4267          struct atomisp_device *isp =
=3D asd->isp;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4268          struct ia_css_pipe_config *v=
p_cfg =3D
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4269                      &asd->stream_env=
[ATOMISP_INPUT_STREAM_GENERAL].
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4270                      pipe_configs[IA_=
CSS_PIPE_ID_VIDEO];
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4271
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4272          /* Read parameter for 3A bin=
ary info */
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4273          if (flag =3D=3D 0) {
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4274                  struct atomisp_css_d=
vs_grid_info *dvs_grid_info =3D
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4275                      atomisp_css_get_=
dvs_grid_info(
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4276                          &asd->params=
.curr_grid_info);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4277
> bdfe0beb95eebc drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19 @4278                  if (!&config->info) {
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4279                          dev_err(isp-=
>dev, "ERROR: NULL pointer in grid_info\n");
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4280                          return -EINV=
AL;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4281                  }
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4282                  atomisp_curr_user_gr=
id_info(asd, &config->info);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4283
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4284                  /* We always return =
the resolution and stride even if there is
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4285                   * no valid metadata=
. This allows the caller to get the
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4286                   * information neede=
d to allocate user-space buffers. */
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4287                  config->metadata_con=
fig.metadata_height =3D asd->
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4288                          stream_env[A=
TOMISP_INPUT_STREAM_GENERAL].stream_info.
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4289                          metadata_inf=
o.resolution.height;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4290                  config->metadata_con=
fig.metadata_stride =3D asd->
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4291                          stream_env[A=
TOMISP_INPUT_STREAM_GENERAL].stream_info.
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4292                          metadata_inf=
o.stride;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4293
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4294                  /* update dvs grid i=
nfo */
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4295                  if (dvs_grid_info)
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4296                          memcpy(&conf=
ig->dvs_grid,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4297                                 dvs_g=
rid_info,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4298                                 sizeo=
f(struct atomisp_css_dvs_grid_info));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4299
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4300                  if (asd->run_mode->v=
al !=3D ATOMISP_RUN_MODE_VIDEO) {
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4301                          config->dvs_=
envelop.width =3D 0;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4302                          config->dvs_=
envelop.height =3D 0;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4303                          return 0;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4304                  }
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4305
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4306                  /* update dvs envelo=
p info */
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4307                  if (!asd->continuous=
_mode->val) {
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4308                          config->dvs_=
envelop.width =3D vp_cfg->dvs_envelope.width;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4309                          config->dvs_=
envelop.height =3D
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4310                              vp_cfg->=
dvs_envelope.height;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4311                  } else {
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4312                          unsigned int=
 dvs_w, dvs_h, dvs_w_max, dvs_h_max;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4313
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4314                          dvs_w =3D vp=
_cfg->bayer_ds_out_res.width -
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4315                                  vp_c=
fg->output_info[0].res.width;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4316                          dvs_h =3D vp=
_cfg->bayer_ds_out_res.height -
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4317                                  vp_c=
fg->output_info[0].res.height;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4318                          dvs_w_max =
=3D rounddown(
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4319                                      =
    vp_cfg->output_info[0].res.width / 5,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4320                                      =
    ATOM_ISP_STEP_WIDTH);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4321                          dvs_h_max =
=3D rounddown(
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4322                                      =
    vp_cfg->output_info[0].res.height / 5,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4323                                      =
    ATOM_ISP_STEP_HEIGHT);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4324
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4325                          config->dvs_=
envelop.width =3D min(dvs_w, dvs_w_max);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4326                          config->dvs_=
envelop.height =3D min(dvs_h, dvs_h_max);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4327                  }
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4328
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4329                  return 0;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4330          }
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4331
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4332          memcpy(&asd->params.css_para=
m.wb_config, &config->wb_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4333                 sizeof(struct atomisp=
_css_wb_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4334          memcpy(&asd->params.css_para=
m.ob_config, &config->ob_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4335                 sizeof(struct atomisp=
_css_ob_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4336          memcpy(&asd->params.css_para=
m.dp_config, &config->dp_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4337                 sizeof(struct atomisp=
_css_dp_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4338          memcpy(&asd->params.css_para=
m.de_config, &config->de_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4339                 sizeof(struct atomisp=
_css_de_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4340          memcpy(&asd->params.css_para=
m.dz_config, &config->dz_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4341                 sizeof(struct atomisp=
_css_dz_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4342          memcpy(&asd->params.css_para=
m.ce_config, &config->ce_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4343                 sizeof(struct atomisp=
_css_ce_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4344          memcpy(&asd->params.css_para=
m.nr_config, &config->nr_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4345                 sizeof(struct atomisp=
_css_nr_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4346          memcpy(&asd->params.css_para=
m.ee_config, &config->ee_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4347                 sizeof(struct atomisp=
_css_ee_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4348          memcpy(&asd->params.css_para=
m.tnr_config, &config->tnr_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4349                 sizeof(struct atomisp=
_css_tnr_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4350
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4351          if (asd->params.color_effect=
 =3D=3D V4L2_COLORFX_NEGATIVE) {
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4352                  asd->params.css_para=
m.cc_config.matrix[3] =3D -config->cc_config.matrix[3];
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4353                  asd->params.css_para=
m.cc_config.matrix[4] =3D -config->cc_config.matrix[4];
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4354                  asd->params.css_para=
m.cc_config.matrix[5] =3D -config->cc_config.matrix[5];
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4355                  asd->params.css_para=
m.cc_config.matrix[6] =3D -config->cc_config.matrix[6];
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4356                  asd->params.css_para=
m.cc_config.matrix[7] =3D -config->cc_config.matrix[7];
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4357                  asd->params.css_para=
m.cc_config.matrix[8] =3D -config->cc_config.matrix[8];
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4358          }
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4359
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4360          if (asd->params.color_effect=
 !=3D V4L2_COLORFX_SEPIA &&
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4361              asd->params.color_effect=
 !=3D V4L2_COLORFX_BW) {
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4362                  memcpy(&asd->params.=
css_param.cc_config, &config->cc_config,
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4363                         sizeof(struct=
 atomisp_css_cc_config));
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4364                  atomisp_css_set_cc_c=
onfig(asd, &asd->params.css_param.cc_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4365          }
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4366
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4367          atomisp_css_set_wb_config(as=
d, &asd->params.css_param.wb_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4368          atomisp_css_set_ob_config(as=
d, &asd->params.css_param.ob_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4369          atomisp_css_set_de_config(as=
d, &asd->params.css_param.de_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4370          atomisp_css_set_dz_config(as=
d, &asd->params.css_param.dz_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4371          atomisp_css_set_ce_config(as=
d, &asd->params.css_param.ce_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4372          atomisp_css_set_dp_config(as=
d, &asd->params.css_param.dp_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4373          atomisp_css_set_nr_config(as=
d, &asd->params.css_param.nr_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4374          atomisp_css_set_ee_config(as=
d, &asd->params.css_param.ee_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4375          atomisp_css_set_tnr_config(a=
sd, &asd->params.css_param.tnr_config);
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4376          asd->params.css_update_param=
s_needed =3D true;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4377
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4378          return 0;
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4379  }
> ad85094b293e40 drivers/staging/media/atomisp/pci/atomisp2/atomisp_cmd.c M=
auro Carvalho Chehab 2020-04-19  4380
>
> :::::: The code at line 4278 was first introduced by commit
> :::::: bdfe0beb95eebc864f341fd0c5e903672b90b1a2 media: atomisp: fix sever=
al coding style issues
>
> :::::: TO: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
> :::::: CC: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
>
> ---
> 0-DAY CI Kernel Test Service, Intel Corporation
> https://lists.01.org/hyperkitty/list/kbuild-all(a)lists.01.org
>
> --
> You received this message because you are subscribed to the Google Groups=
 "Clang Built Linux" group.
> To unsubscribe from this group and stop receiving emails from it, send an=
 email to clang-built-linux+unsubscribe(a)googlegroups.com.
> To view this discussion on the web visit https://groups.google.com/d/msgi=
d/clang-built-linux/202005210222.fkqS2pnd%25lkp%40intel.com.



-- =

Thanks,
~Nick Desaulniers
--===============8717149364521302844==--

